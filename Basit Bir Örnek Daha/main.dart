import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Dikkat
// pubspec.yaml dosyasına   sqflite: eklenmelidir

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Ekranı'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  labelStyle: TextStyle(fontSize: 14),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kullanıcı adı boş olamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(fontSize: 14),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre boş olamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    bool loginSuccess =
                        await dbHelper.loginUser(username, password);

                    if (loginSuccess) {
                      // Eğer giriş başarılı ise ana ekrana yönlendir
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    } else {
                      // Eğer giriş başarısız ise hata mesajı göster
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Yanlış kullanıcı adı veya şifre!')),
                      );
                    }
                  }
                },
                child: Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyData {
  final int id;
  final String name;
  final String email;
  final String tc;

  MyData(
      {required this.id,
      required this.name,
      required this.email,
      required this.tc});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'tc': tc,
    };
  }

  factory MyData.fromMap(Map<String, dynamic> map) {
    return MyData(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      tc: map['tc'] ?? '',
    );
  }
}

class DatabaseHelper {
  Database? _database;

  Future<Database> get db async => _database ??= await initDatabase();

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    const dbName = 'veritabanim12.db';
    final path = join(dbPath, dbName);

    final database = await openDatabase(path, onCreate: (db, version) async {
      // 'tablo' tablosunun var olup olmadığına bakılmaksızın sadece tablonun var olduğundan emin oluruz
      await db.execute('''
        CREATE TABLE IF NOT EXISTS tablo (
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT,
          tc TEXT
        )
      ''');

      // Eğer tabloyu oluşturmuşsak, birkaç örnek veri ekleriz
      await db.insert(
        'tablo',
        {'name': 'John', 'email': 'john@example.com', 'tc': '12345678901'},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await db.insert('tablo',
          {'name': 'Ali', 'email': 'ali@example.com', 'tc': '98765432100'},
          conflictAlgorithm: ConflictAlgorithm.replace);
      await db.insert(
        'tablo',
        {'name': 'Ali', 'email': 'ali@example.com', 'tc': '12312312312'},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // 'users' tablosu eklemek (yeni tablonuz)
      await db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY,
          username TEXT,
          password TEXT
        )
      ''');

      // 'users' tablosuna örnek kullanıcılar eklemek
      await db.insert('users', {'username': 'kaan', 'password': 'kaan'},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }, version: 1);

    return database;
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    final db = await this.db;
    return await db.insert('tablo', data);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await this.db;
    return await db.query('tablo');
  }

  Future<int> updateData(Map<String, dynamic> data, int id) async {
    final db = await this.db;
    return await db.update('tablo', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteData(int id) async {
    final db = await this.db;
    return await db.delete('tablo', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> loginUser(String username, String password) async {
    final db = await this.db;

    // Kullanıcıyı 'users' tablosunda ara
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return users.isNotEmpty;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dbHelper = DatabaseHelper();

  List<MyData> kisiler = [];
  List<MyData> filtrelenmisKisiler = [];

  int kisiSayisi = 0;

  final _nameControllerInsert = TextEditingController();
  final _emailControllerInsert = TextEditingController();
  final _tcControllerInsert = TextEditingController();
  late TextEditingController _nameControllerUpdate = TextEditingController();
  late TextEditingController _emailControllerUpdate = TextEditingController();
  late TextEditingController _tcControllerUpdate = TextEditingController();

  bool aramaYapiliyor = false;

  @override
  void initState() {
    initDatabaseAndGetData();
    super.initState();
  }

  void initDatabaseAndGetData() async {
    try {
      await dbHelper.initDatabase();
      final data = await dbHelper.getData();

      final myDataList = data.map((item) => MyData.fromMap(item)).toList();

      setState(() {
        kisiler = myDataList;
        filtrelenmisKisiler = myDataList;
        kisiSayisi = myDataList.length;
      });
    } catch (e) {
      print("Veritabanı bağlantısında veya veri çekme işleminde hata: $e");
    }
  }

  Future<void> _deleteItem(int id) async {
    try {
      await dbHelper.deleteData(id);
      initDatabaseAndGetData();
    } catch (e) {
      print("Kisi silinirken hata oluştu: $e");
    }
  }

  void _addPerson(String name, String email, String tc) async {
    try {
      await dbHelper.insertData({'name': name, 'email': email, 'tc': tc});
      initDatabaseAndGetData();
    } catch (e) {
      print("Kisi eklenirken hata oluştu: $e");
    }
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kisi Sil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bu kişiyi silmek istediğinize emin misiniz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Vazgeç'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () {
                _deleteItem(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddPersonDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kisi Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameControllerInsert,
                decoration: InputDecoration(labelText: 'Ad'),
              ),
              TextField(
                controller: _emailControllerInsert,
                decoration: InputDecoration(labelText: 'E-posta'),
              ),
              TextField(
                controller: _tcControllerInsert,
                decoration: InputDecoration(labelText: 'TC Kimlik No'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Vazgeç'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ekle'),
              onPressed: () {
                // Yeni kişiyi veritabanına ekleme
                final name = _nameControllerInsert.text;
                final email = _emailControllerInsert.text;
                final tc = _tcControllerInsert.text;

                if (name.isNotEmpty && email.isNotEmpty && tc.isNotEmpty) {
                  _addPerson(name, email, tc);
                  _nameControllerInsert.clear();
                  _emailControllerInsert.clear();
                  _tcControllerInsert.clear();
                  Navigator.of(context).pop();
                } else {
                  // Hata mesajı gösterme veya doğrulama
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateItem(BuildContext context, int id) async {
    // Mevcut kişinin verilerini al
    final person = kisiler.firstWhere((p) => p.id == id);
    _nameControllerUpdate = TextEditingController(text: person.name);
    _emailControllerUpdate = TextEditingController(text: person.email);
    _tcControllerUpdate = TextEditingController(text: person.tc);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kisi Güncelle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameControllerUpdate,
                decoration: InputDecoration(labelText: 'Ad'),
              ),
              TextField(
                controller: _emailControllerUpdate,
                decoration: InputDecoration(labelText: 'E-posta'),
              ),
              TextField(
                controller: _tcControllerUpdate,
                decoration: InputDecoration(labelText: 'TC Kimlik No'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Vazgeç'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Güncelle'),
              onPressed: () async {
                final name = _nameControllerUpdate.text;
                final email = _emailControllerUpdate.text;
                final tc = _tcControllerUpdate.text;

                if (name.isNotEmpty && email.isNotEmpty && tc.isNotEmpty) {
                  // Kişinin verilerini güncelle
                  await dbHelper
                      .updateData({'name': name, 'email': email, 'tc': tc}, id);
                  initDatabaseAndGetData();
                  Navigator.of(context).pop();
                } else {
                  // Hata mesajı gösterme veya doğrulama
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQFlite Veritabanı',
      home: Scaffold(
        appBar: AppBar(
          title: aramaYapiliyor
              ? TextField(
                  onChanged: (query) {
                    // Arama sorgusuna göre filtrelenen verileri güncelle
                    setState(() {
                      filtrelenmisKisiler = kisiler
                          .where((person) =>
                              person.name
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              person.email
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              person.tc
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Kisi ara...',
                    border: InputBorder.none,
                  ),
                )
              : Text('Kişisel Veritabanı'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              icon: Icon(
                  aramaYapiliyor ? Icons.clear : Icons.person_search_outlined),
              onPressed: () {
                setState(() {
                  aramaYapiliyor = !aramaYapiliyor;
                  if (!aramaYapiliyor) {
                    filtrelenmisKisiler = kisiler;
                  }
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: (filtrelenmisKisiler.isNotEmpty)
                ? ListView.builder(
                    itemCount: filtrelenmisKisiler.length,
                    itemBuilder: (BuildContext context, int position) {
                      return Card(
                        color: Colors.yellow[200],
                        elevation: 1.0,
                        child: ListTile(
                          leading: Container(
                            width: 70,
                            child: TextButton(
                              onPressed: () => _updateItem(
                                  context, filtrelenmisKisiler[position].id),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.blue),
                                  SizedBox(width: 10),
                                  Text(
                                    filtrelenmisKisiler[position].id.toString(),
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          title: Text(filtrelenmisKisiler[position].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(filtrelenmisKisiler[position].email),
                              Text('TC: ${filtrelenmisKisiler[position].tc}'),
                            ],
                          ),
                          trailing: GestureDetector(
                            child: Icon(
                              Icons.person_remove_alt_1_outlined,
                              color: Colors.pink,
                            ),
                            onTap: () {
                              _showDeleteConfirmationDialog(
                                  context, filtrelenmisKisiler[position].id);
                            },
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("Eşleşen veri bulunamadı"),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.green,
          onPressed: () {
            _showAddPersonDialog(context);
          },
          child: Icon(Icons.person_add_alt),
        ),
      ),
    );
  }
}
