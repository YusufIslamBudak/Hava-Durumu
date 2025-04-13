import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HavaDurumuEkrani(),
    );
  }
}

class HavaDurumuEkrani extends StatefulWidget {
  @override
  _HavaDurumuEkraniState createState() => _HavaDurumuEkraniState();
}

class _HavaDurumuEkraniState extends State<HavaDurumuEkrani> {
  final List<Map<String, dynamic>> havaDurumuListesi = [
    {'city': 'Adana', 'main': {'temp': 30.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Taş Köprü, Seyhan Nehri','image': 'https://blog.tatildenince.com/wp-content/uploads/2024/01/adana-gezilecek-yerler-800x400.jpg',},
    {'city': 'Adıyaman', 'main': {'temp': 28.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 45}, 'places': 'Nemrut Dağı','image':'https://sanaltur.adiyaman.bel.tr/tarihiyerler/img/adiyaman.jpg'},
    {'city': 'Afyonkarahisar', 'main': {'temp': 22.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 55}, 'places': 'Afyon Kalesi, Kaplıcalar','image':'https://www.afyonturkeligazetesi.com/images/haberler/2023/11/afyonkarahisar-in-tarihi-3000.jpeg'},
    {'city': 'Ağrı', 'main': {'temp': 15.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 60}, 'places': 'İshak Paşa Sarayı, Ağrı Dağı','image':'https://blog.tatildenince.com/wp-content/uploads/2024/01/agri-gezilecek-yerler-800x400.jpg'},
    {'city': 'Aksaray', 'main': {'temp': 25.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 35}, 'places': 'Ihlara Vadisi, Selime Katedrali','image':'yok'},
    {'city': 'Amasya', 'main': {'temp': 20.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 1.5}, 'main_details': {'humidity': 50}, 'places': 'Kral Kaya Mezarları, Yeşilırmak','image':'yok'},
    {'city': 'Ankara', 'main': {'temp': 18.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.1}, 'main_details': {'humidity': 55}, 'places': 'Anıtkabir, Kuğulu Park, ve Eymir Gölü','image':'https://uo.asbu.edu.tr/sites/idari_birimler/uo.asbu.edu.tr/files/inline-images/Ankara.jpg'},
    {'city': 'Antalya', 'main': {'temp': 28.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 65}, 'places': 'Konyaaltı Plajı, Kaleiçi, ve Düden Şelalesi','image':'yok'},
    {'city': 'Ardahan', 'main': {'temp': 12.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 70}, 'places': 'Çıldır Gölü','image':'yok'},
    {'city': 'Artvin', 'main': {'temp': 19.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 4.0}, 'main_details': {'humidity': 75}, 'places': 'Karagöl, Şavşat','image':'yok'},
    {'city': 'Balıkesir', 'main': {'temp': 21.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 55}, 'places': 'Kaz Dağları, Ayvalık','image':'yok'},
    {'city': 'Bilecik', 'main': {'temp': 20.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 1.5}, 'main_details': {'humidity': 50}, 'places': 'Şeyh Edebali Türbesi, Osmanlı Köyü','image':'yok'},
    {'city': 'Bingöl', 'main': {'temp': 18.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 60}, 'places': 'Yüzen Adalar','image':'yok'},
    {'city': 'Bitlis', 'main': {'temp': 17.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 65}, 'places': 'Nemrut Krater Gölü','image':'yok'},
    {'city': 'Bolu', 'main': {'temp': 16.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 60}, 'places': 'Abant Gölü, Yedigöller','image':'yok'},
    {'city': 'Burdur', 'main': {'temp': 25.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 40}, 'places': 'Salda Gölü','image':'yok'},
    {'city': 'Bursa', 'main': {'temp': 22.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 55}, 'places': 'Uludağ, Cumalıkızık','image':'yok'},
    {'city': 'Çanakkale', 'main': {'temp': 24.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.2}, 'main_details': {'humidity': 45}, 'places': 'Truva Antik Kenti, Assos','image':'yok'},
    {'city': 'Çankırı', 'main': {'temp': 18.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Tuz Mağarası','image':'yok'},
    {'city': 'Çorum', 'main': {'temp': 20.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.7}, 'main_details': {'humidity': 55}, 'places': 'Hattuşaş Antik Kenti'},
    {'city': 'Çanakkale', 'main': {'temp': 24.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.2}, 'main_details': {'humidity': 45}, 'places': 'Truva Antik Kenti, Assos','image':'yok'},
    {'city': 'Çankırı', 'main': {'temp': 18.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Tuz Mağarası','image':'yok'},
    {'city': 'Çorum', 'main': {'temp': 20.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.7}, 'main_details': {'humidity': 55}, 'places': 'Hattuşaş Antik Kenti','image':'yok'},
    {'city': 'Denizli', 'main': {'temp': 26.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 40}, 'places': 'Pamukkale, Hierapolis','image':'yok'},
    {'city': 'Diyarbakır', 'main': {'temp': 32.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 30}, 'places': 'Diyarbakır Surları, Hevsel Bahçeleri','image':'yok'},
    {'city': 'Düzce', 'main': {'temp': 22.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Samandere Şelalesi, Güzeldere Şelalesi','image':'yok'},
    {'city': 'Edirne', 'main': {'temp': 20.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 55}, 'places': 'Selimiye Camii, Meriç Nehri','image':'yok'},
    {'city': 'Elazığ', 'main': {'temp': 24.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 45}, 'places': 'Harput Kalesi, Keban Barajı','image':'yok'},
    {'city': 'Erzincan', 'main': {'temp': 21.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 50}, 'places': 'Ergan Dağı, Girlevik Şelalesi','image':'yok'},
    {'city': 'Erzurum', 'main': {'temp': 15.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 4.0}, 'main_details': {'humidity': 60}, 'places': 'Palandöken, Çifte Minareli Medrese','image':'yok'},
    {'city': 'Eskişehir', 'main': {'temp': 23.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 45}, 'places': 'Odunpazarı Evleri, Porsuk Çayı','image':'yok'},
    {'city': 'Gaziantep', 'main': {'temp': 30.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 35}, 'places': 'Zeugma Mozaik Müzesi, Bakırcılar Çarşısı','image':'yok'},
    {'city': 'Giresun', 'main': {'temp': 20.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 3.2}, 'main_details': {'humidity': 70}, 'places': 'Giresun Adası, Kümbet Yaylası','image':'yok'},
    {'city': 'Gümüşhane', 'main': {'temp': 19.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 65}, 'places': 'Karaca Mağarası','image':'yok'},
    {'city': 'Hakkâri', 'main': {'temp': 16.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 4.0}, 'main_details': {'humidity': 75}, 'places': 'Cilo Dağları','image':'yok'},
    {'city': 'Hatay', 'main': {'temp': 27.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 60}, 'places': 'Antakya Arkeoloji Müzesi, Titus Tüneli','image':'yok'},
    {'city': 'Iğdır', 'main': {'temp': 22.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 55}, 'places': 'Aras Kuş Cenneti','image':'yok'},
    {'city': 'Isparta', 'main': {'temp': 25.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 45}, 'places': 'Eğirdir Gölü, Gül Bahçeleri','image':'yok'},
    {'city': 'İstanbul', 'main': {'temp': 23.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 65}, 'places': 'Ayasofya, Topkapı Sarayı, Galata Kulesi','image':'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Historical_peninsula_and_modern_skyline_of_Istanbul.jpg/800px-Historical_peninsula_and_modern_skyline_of_Istanbul.jpg'},
    {'city': 'İzmir', 'main': {'temp': 26.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 50}, 'places': 'Efes, Saat Kulesi, Kordon','image':'https://sehirgazetesicomtr.teimg.com/crop/1280x720/sehirgazetesi-com-tr/uploads/2023/10/izmir-hangi-avrupa-sehrine-benziyor-sehirgazetesi-16102023-1-manset.png'},
    {'city': 'Kahramanmaraş', 'main': {'temp': 28.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 60}, 'places': 'Yedi Kuyular, Maraş Kalesi','image':'yok'},
    {'city': 'Karabük', 'main': {'temp': 19.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 50}, 'places': 'Safranbolu, Tokatlı Kanyonu','image':'yok'},
    {'city': 'Karaman', 'main': {'temp': 24.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 45}, 'places': 'Binbir Kilise, Karaman Kalesi','image':'yok'},
    {'city': 'Kars', 'main': {'temp': 10.0}, 'weather': [{'description': 'soğuk', 'icon': Icons.ac_unit}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 70}, 'places': 'Ani Harabeleri, Çıldır Gölü','image':'yok'},
    {'city': 'Kastamonu', 'main': {'temp': 18.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.7}, 'main_details': {'humidity': 55}, 'places': 'Ilgaz Dağı, Küre Dağları','image':'yok'},
    {'city': 'Kayseri', 'main': {'temp': 23.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 3.2}, 'main_details': {'humidity': 50}, 'places': 'Erciyes Dağı, Kapuzbaşı Şelalesi','image':'yok'},
    {'city': 'Kırıkkale', 'main': {'temp': 20.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 45}, 'places': 'Silah Sanayi Müzesi','image':'yok'},
    {'city': 'Kırklareli', 'main': {'temp': 22.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 40}, 'places': 'Dupnisa Mağarası, İğneada Longozu','image':'yok'},
    {'city': 'Kırşehir', 'main': {'temp': 21.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Cacabey Medresesi, Seyfe Gölü','image':'yok'},
    {'city': 'Kilis', 'main': {'temp': 27.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 35}, 'places': 'Oylum Höyük','image':'yok'},
    {'city': 'Kocaeli', 'main': {'temp': 24.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 55}, 'places': 'Kartepe, Sapanca Gölü','image':'yok'},
    {'city': 'Konya', 'main': {'temp': 25.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 40}, 'places': 'Mevlana Müzesi, Çatalhöyük','image':'yok'},
    {'city': 'Kütahya', 'main': {'temp': 20.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 55}, 'places': 'Frig Vadisi, Kütahya Kalesi','image':'yok'},
    {'city': 'Malatya', 'main': {'temp': 26.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 35}, 'places': 'Arslantepe Höyüğü, Nemrut Heykelleri','image':'yok'},
    {'city': 'Manisa', 'main': {'temp': 28.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 30}, 'places': 'Spil Dağı, Sardes Antik Kenti','image':'yok'},
    {'city': 'Mardin', 'main': {'temp': 30.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 40}, 'places': 'Midyat, Deyrulzafaran Manastırı','image':'yok'},
    {'city': 'Mersin', 'main': {'temp': 27.0}, 'weather': [{'description': 'güneşli', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Kızkalesi, Cennet ve Cehennem','image':'yok'},
    {'city': 'Muğla', 'main': {'temp': 29.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 40}, 'places': 'Fethiye, Bodrum, Marmaris','image':'yok'},
    {'city': 'Muş', 'main': {'temp': 18.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 60}, 'places': 'Muş Ovası','image':'yok'},
    {'city': 'Nevşehir', 'main': {'temp': 20.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 45}, 'places': 'Kapadokya, Göreme','image':'yok'},
    {'city': 'Niğde', 'main': {'temp': 19.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 50}, 'places': 'Aladağlar Milli Parkı','image':'yok'},
    {'city': 'Ordu', 'main': {'temp': 23.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 55}, 'places': 'Boztepe, Çambaşı Yaylası','image':'yok'},
    {'city': 'Osmaniye', 'main': {'temp': 28.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 45}, 'places': 'Karatepe-Aslantaş','image':'yok'},
    {'city': 'Rize', 'main': {'temp': 19.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 3.5}, 'main_details': {'humidity': 70}, 'places': 'Ayder Yaylası, Rize Kalesi','image':'yok'},
    {'city': 'Sakarya', 'main': {'temp': 21.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.0}, 'main_details': {'humidity': 50}, 'places': 'Sapanca, Taraklı','image':'yok'},
    {'city': 'Samsun', 'main': {'temp': 22.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 55}, 'places': 'Bandırma Vapuru, Amisos Tepesi','image':'yok'},
    {'city': 'Şanlıurfa', 'main': {'temp': 33.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 30}, 'places': 'Göbeklitepe, Balıklıgöl','image':'yok'},
    {'city': 'Siirt', 'main': {'temp': 25.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 50}, 'places': 'Tillo, Botan Vadisi','image':'yok'},
    {'city': 'Sinop', 'main': {'temp': 20.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 55}, 'places': 'Hamsilos Koyu','image':'yok'},
    {'city': 'Şırnak', 'main': {'temp': 27.0}, 'weather': [{'description': 'sıcak', 'icon': Icons.wb_sunny}], 'wind': {'speed': 3.2}, 'main_details': {'humidity': 40}, 'places': 'Cudi Dağı','image':'yok'},
    {'city': 'Sivas', 'main': {'temp': 18.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 60}, 'places': 'Divriği Ulu Camii','image':'yok'},
    {'city': 'Tekirdağ', 'main': {'temp': 23.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 45}, 'places': 'Şarköy, Uçmakdere','image':'yok'},
    {'city': 'Tokat', 'main': {'temp': 21.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 50}, 'places': 'Ballıca Mağarası','image':'yok'},
    {'city': 'Trabzon', 'main': {'temp': 20.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 65}, 'places': 'Sümela Manastırı','image':'yok'},
    {'city': 'Tunceli', 'main': {'temp': 18.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 60}, 'places': 'Munzur Vadisi','image':'yok'},
    {'city': 'Uşak', 'main': {'temp': 22.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.3}, 'main_details': {'humidity': 55}, 'places': 'Blaundos Antik Kenti','image':'yok'},
    {'city': 'Van', 'main': {'temp': 16.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 2.8}, 'main_details': {'humidity': 65}, 'places': 'Van Gölü, Akdamar Adası','image':'yok'},
    {'city': 'Yalova', 'main': {'temp': 20.0}, 'weather': [{'description': 'açık hava', 'icon': Icons.wb_sunny}], 'wind': {'speed': 2.5}, 'main_details': {'humidity': 50}, 'places': 'Termal Kaplıcaları','image':'yok'},
    {'city': 'Yozgat', 'main': {'temp': 19.0}, 'weather': [{'description': 'parçalı bulutlu', 'icon': Icons.cloud}], 'wind': {'speed': 2.7}, 'main_details': {'humidity': 55}, 'places': 'Çamlık Milli Parkı','image':'yok'},
    {'city': 'Zonguldak', 'main': {'temp': 18.0}, 'weather': [{'description': 'yağışlı', 'icon': Icons.beach_access}], 'wind': {'speed': 3.0}, 'main_details': {'humidity': 60}, 'places': 'Filyos, Gökgöl Mağarası','image':'yok'},
];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Türkiye Hava Durumu Uygulaması',
          textAlign: TextAlign.center,
        ),
        centerTitle: true, // Başlığı ortaya hizalar
      ),
      backgroundColor: Color(0xFF448AFF)
      ,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Şehir Ara',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: havaDurumuListesi.length,
              itemBuilder: (context, index) {
                final havaDurumu = havaDurumuListesi[index];

                if (searchQuery.isNotEmpty &&
                    !havaDurumu['city']
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase())) {
                  return Container();
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SehirDetayEkrani(
                          city: havaDurumu['city'],
                          description: havaDurumu['weather'][0]['description'],
                          temperature: (havaDurumu['main']['temp'] as num).toDouble(),
                          places: havaDurumu['places'],
                          image: havaDurumu['image'], // Resim bilgisi burada aktarılıyor
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            havaDurumu['weather'][0]['icon'],
                            size: 48,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  havaDurumu['city'],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal.shade900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Sıcaklık: ${havaDurumu['main']['temp']}°C',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Hava Durumu: ${havaDurumu['weather'][0]['description']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Nem: ${havaDurumu['main_details']['humidity']}%',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Rüzgar Hızı: ${havaDurumu['wind']['speed']} m/s',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SehirDetayEkrani extends StatelessWidget {
  final String city;
  final String description;
  final double temperature;
  final String places;
  final String image; // Resim bilgisi eklendi

  SehirDetayEkrani({
    required this.city,
    required this.description,
    required this.temperature,
    required this.places,
    required this.image, // Resim bilgisi eklendi
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$city Hava Durumu'),
      ),
      body: Container(
        color: Colors.teal.shade50,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network( // Resim gösterimi
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              '$city - Hava Durumu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Sıcaklık: $temperature°C',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hava Durumu: $description',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Bu havada $city\'de gezilebilecek yerler:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              places,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


