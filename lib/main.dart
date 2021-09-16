import 'package:flutter/material.dart';
import 'package:flutter_sanliurfa_tarih/detay_sayfasi.dart';
import 'package:flutter_sanliurfa_tarih/sanliurfa_tarih.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<SanliurfaTarih>> tarihGetir() async {
    var tarihListesi = <SanliurfaTarih>[];
    var tarih_bir = SanliurfaTarih(1, "Göbeklitepe",
        "assets/images/gobeklitepe.png", "Tarihin Sıfır Noktası");
    var tarih_iki = SanliurfaTarih(
        2, "Balıklıgöl", "assets/images/balikligol.png", "Halil-ür Rahman");
    var tarih_uc = SanliurfaTarih(
        3, "Harran Evleri", "assets/images/harranevleri.png", "Kubbeli Ev");
    var tarih_dort = SanliurfaTarih(
        4, "Şuab Şehri", "assets/images/suabsehri.png", "Peygamber Makamı");
    var tarih_bes = SanliurfaTarih(
        5, "Halfeti", "assets/images/Halfeti.png", "Saklı Cennet");
    var tarih_alti = SanliurfaTarih(
        6, "Gümrük Hanı", "assets/images/gumrukhani.png", "Asırlara Sığmanyan");

    tarihListesi.add(tarih_bir);
    tarihListesi.add(tarih_iki);
    tarihListesi.add(tarih_uc);
    tarihListesi.add(tarih_dort);
    tarihListesi.add(tarih_bes);
    tarihListesi.add(tarih_alti);

    return tarihListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Şalıurfa Tarihi Mekanlar")),
        ),
        body: FutureBuilder<List<SanliurfaTarih>>(
          future: tarihGetir(),
          builder: (context, snaphost) {
            if (snaphost.hasData) {
              var tarihListesi = snaphost.data;
              return ListView.builder(
                  itemCount: tarihListesi!.length,
                  itemBuilder: (context, indeks) {
                    var tarih = tarihListesi[indeks];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetaySayfasi(tarih: tarih)));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                child: Image.asset(tarih.tarih_resim_id),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tarih.tarih_adi,
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(height: 50),
                                Text(
                                  tarih.tarih_detay,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center();
            }
          },
        ));
  }
}
