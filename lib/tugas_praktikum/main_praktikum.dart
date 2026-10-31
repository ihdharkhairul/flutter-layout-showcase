import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Info Transit Kota Bandung'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildHeaderCard(),
            SizedBox(height: 16),
            buildStatusBar(),
            SizedBox(height: 16),
            buildArmadaGrid(),
            SizedBox(height: 16),
            buildFotoBannerStack(),
          ],
        ),
      ),
    ),
  ));
}

// SOAL 1
Widget buildHeaderCard() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.blue.shade900, Colors.blue.shade600],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.directions_bus, color: Colors.white, size: 32),
        SizedBox(width: 12),
        Text('Terminal Kota Bandung',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    ),
  );
}
// Soal 1 - Kesimpulan: Container dengan BoxDecoration dipakai untuk styling kartu (gradasi, sudut membulat, bayangan), dan Row menata ikon dan teks secara horizontal.

// SOAL 2
Widget buildStatusBar() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      children: [
        Icon(Icons.access_time, color: Colors.orange),
        SizedBox(width: 8),
        Text('Operasional: 05.00 - 23.00'),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'LANCAR',
            style: TextStyle(color: Colors.green.shade900),
          ),
        ),
      ],
    ),
  );
}
// Soal 2 - Kesimpulan: Spacer mengisi sisa ruang pada Row sehingga badge status terdorong ke tepi kanan tanpa perlu menghitung lebar layar.

// SOAL 3
Widget buildArmadaGrid() {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.directions_bus, color: Colors.teal),
                  Text('60% KAPASITAS',
                      style: TextStyle(fontSize: 9, color: Colors.teal)),
                ],
              ),
              SizedBox(height: 8),
              Text('18 Bus Utama',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      SizedBox(width: 12),
      Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.tram, color: Colors.indigo),
                  Text('40%',
                      style: TextStyle(fontSize: 9, color: Colors.indigo)),
                ],
              ),
              SizedBox(height: 8),
              Text('6 LRT Feeder',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ],
  );
}
// Soal 3 - Kesimpulan: Expanded dengan flex 3 dan 2 membagi lebar layar secara proporsional (60:40), dan SizedBox memberi jarak tetap antar kartu.

// SOAL 4
Widget buildFotoBannerStack() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                'assets/images/terminal.png',
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 130,
                    color: Colors.blueGrey[200],
                    child: Center(
                        child: Icon(Icons.image,
                            size: 40, color: Colors.blueGrey)),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 18, color: Colors.blueGrey),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Pemantauan kamera telemetri dan CCTV halte cerdas beroperasi 24 jam untuk keselamatan publik.',
                      style: TextStyle(
                          fontSize: 11, color: Colors.blueGrey[800]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'LIVE CCTV',
            style: TextStyle(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
// Soal 4 - Kesimpulan: 