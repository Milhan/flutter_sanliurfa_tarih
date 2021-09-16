import 'package:flutter/material.dart';
import 'package:flutter_sanliurfa_tarih/sanliurfa_tarih.dart';

class DetaySayfasi extends StatefulWidget {
  SanliurfaTarih tarih;
  DetaySayfasi({required this.tarih});

  @override
  _DetaySayfasiState createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tarih.tarih_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.tarih.tarih_resim_id),
            Center(
              child: Text(
                widget.tarih.tarih_detay,
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                label: Text("İNCELE"))
          ],
        ),
      ),
    );
  }
}
