import 'package:flutter/material.dart';

class NavigasiSederhanaPage extends StatelessWidget {
  const NavigasiSederhanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: const Text(
          'Navigasi Sederhana',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF5C6BC0).withAlpha(20),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF5C6BC0).withAlpha(76)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFF5C6BC0)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Ini adalah Halaman A.\nTekan tombol di bawah untuk berpindah ke Halaman B.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF37474F), height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              '📍 Halaman A',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37474F),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Halaman ini merupakan titik awal navigasi.\nGunakan Navigator.push untuk berpindah halaman.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.6),
            ),
            const SizedBox(height: 32),

            // Tombol navigasi ke halaman B
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const _HalamanBPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text(
                  'Pergi ke Halaman B',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C6BC0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 4,
                  shadowColor: const Color(0xFF5C6BC0).withAlpha(76),
                ),
              ),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // Penjelasan cara kerja
            const Text(
              'Cara Kerja Navigator:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37474F),
              ),
            ),
            const SizedBox(height: 12),
            _NavExplanation(
              step: '1',
              code: 'Navigator.push(context, route)',
              desc: 'Mendorong halaman baru ke stack navigasi',
            ),
            _NavExplanation(
              step: '2',
              code: 'Navigator.pop(context)',
              desc: 'Menghapus halaman teratas dari stack (kembali)',
            ),
            _NavExplanation(
              step: '3',
              code: 'Navigator.pushReplacement(...)',
              desc: 'Mengganti halaman saat ini dengan halaman baru',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavExplanation extends StatelessWidget {
  final String step;
  final String code;
  final String desc;

  const _NavExplanation({
    required this.step,
    required this.code,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFF5C6BC0),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF37474F),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    code,
                    style: const TextStyle(
                      color: Color(0xFF80CBC4),
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================== HALAMAN B ========================

class _HalamanBPage extends StatelessWidget {
  const _HalamanBPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF26A69A),
        foregroundColor: Colors.white,
        title: const Text(
          'Halaman B',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF26A69A).withAlpha(20),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF26A69A).withAlpha(76)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: Color(0xFF26A69A)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Kamu berhasil pindah ke Halaman B!\nTekan tombol kembali untuk ke Halaman A.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF37474F), height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '📍 Halaman B',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37474F),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Kamu telah sampai di halaman tujuan.\nHalaman ini di-push ke stack Navigator.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.6),
            ),
            const SizedBox(height: 32),

            // Tombol kembali
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text(
                  'Kembali ke Halaman A',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF26A69A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 4,
                  shadowColor: const Color(0xFF26A69A).withAlpha(76),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
