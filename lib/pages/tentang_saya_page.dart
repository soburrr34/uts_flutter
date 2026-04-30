import 'package:flutter/material.dart';

class TentangSayaPage extends StatelessWidget {
  const TentangSayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: const Text(
          'Tentang Saya',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar placeholder
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFFD1C4E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 72,
                  color: Color(0xFF7E57C2),
                ),
              ),
              const SizedBox(height: 24),

              // NPM
              const Text(
                'NPM',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),

              // Nama
              const Text(
                'Nama',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 28),

              // Deskripsi
              const Text(
                'Sekilas tentang saya......',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
