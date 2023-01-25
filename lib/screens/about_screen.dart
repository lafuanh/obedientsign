import 'package:flutter/material.dart';

import 'package:signtome/service/schedule_maker.dart';
import 'package:signtome/service/status_service.dart';

import '../service/notifex.dart';
import '../widgets/bar_window.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key});

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: Color(0xFF1E1E26),
            child: Column(children: [
              const WindowButton(),
              Container(
                height: 200,
                width: 500,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Text(
                    "Selamat datang di halaman Tentang SignTome, sebuah aplikasi yang mengingatkan kamu untuk sholat.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "SignTome dirancang untuk memudahkan kamu dalam mengingat sholat harianmu.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Cara Menggunakan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Untuk memulai, hal pertama yang harus kamu lakukan adalah mengatur lokasimu di halaman pengaturan. Hal ini penting karena jadwal sholat didasarkan pada lokasimu. Setelah mengatur lokasi, kamu dapat menyesuaikan pengaturan lain seperti format waktu, bahasa, dan suara notifikasi (adzan atau tanpa adzan) di halaman pengaturan.",
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      "Di halaman utama, kamu dapat melihat waktu dan tanggal saat ini, serta jadwal sholat berikutnya. Halaman jadwal menunjukkan jadwal sholat untuk hari ini.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Penyesuaian",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  // ignore: prefer_const_constructors
                  Text(
                    "Di halaman pengaturan, kamu dapat menyesuaikan pengaturan notifikasimu lebih lanjut. Kamu dapat memilih untuk menerima pengingat untuk setiap sholat atau mematikan notifikasi sama sekali.\n\nDengan menggunakan SignTome, kamu dapat memastikan bahwa kamu tidak pernah melewatkan sholat lagi. Aplikasi ini mudah digunakan dan dapat disesuaikan dengan kebutuhanmu, sehingga menjadi teman yang sempurna untuk perjalanan spiritualmu.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 25),
                    child: FloatingActionButton(
                      mini: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          showNotifNow("dhuzur");
                        });
                      },
                      child: const Icon(Icons.save),
                    ),
                  ),
                ])),
              ),
            ])));
  }
}
