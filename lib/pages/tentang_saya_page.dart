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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1C4E9),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('lib/image/profil.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                ),
                const SizedBox(height: 16),

                // NPM
                const Text(
                  '20241320046',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),

                // Nama
                const Text(
                  'SOBUR',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Deskripsi
                const Text(
                  'Saya adalah pribadi yang aktif dan memiliki beragam minat di bidang olahraga, kreativitas, dan teknologi. Saya memiliki hobi mendaki gunung, yang melatih ketahanan fisik, mental, serta kemampuan bekerja dalam tim. Selain itu, saya juga aktif di dunia olahraga sebagai pemain sepak bola dan pelatih futsal, yang membantu saya mengembangkan jiwa kepemimpinan, strategi, dan komunikasi.\n\nDi bidang hiburan dan digital, saya memiliki ketertarikan sebagai gamer, serta mendalami videografi dan editing, yang mengasah kreativitas serta kemampuan dalam menghasilkan konten visual yang menarik. Selain itu, saya juga memiliki hobi memasak, yang mencerminkan ketelitian dan kreativitas dalam menciptakan sesuatu.\n\nDengan kombinasi minat tersebut, saya terus berusaha mengembangkan diri baik secara fisik, kreativitas, maupun keterampilan teknis.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF555555),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
