import 'package:flutter/material.dart';

class WidgetBertingkatPage extends StatelessWidget {
  const WidgetBertingkatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 248, 0),
        foregroundColor: Colors.white,
        title: const Text(
          'Widget Bertingkat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: 'Contoh Column + Row + Container Bersarang'),
            const SizedBox(height: 16),

            // === LEVEL 1: Container utama ===
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF5C6BC0).withAlpha(26),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF5C6BC0), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📦 Container Level 1 (Column)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),

                  // === LEVEL 2: Row ===
                  Row(
                    children: [
                      // === LEVEL 3: Container kiri ===
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF43A047).withAlpha(26),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF43A047)),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.star, color: Color(0xFF43A047)),
                              const SizedBox(height: 4),
                              const Text(
                                'Kiri\n(Column\ndalam Row)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // === LEVEL 3: Kolom tengah dengan nested Column ===
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7043).withAlpha(26),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFFF7043)),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.layers,
                                color: Color(0xFFFF7043),
                              ),
                              const SizedBox(height: 4),
                              // === LEVEL 4: Row di dalam Column ===
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFF7043),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFCA28),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Tengah\n(Row L4)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // === LEVEL 3: Container kanan ===
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7E57C2).withAlpha(26),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF7E57C2)),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.widgets,
                                color: Color(0xFF7E57C2),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Kanan\n(Column\ndalam Row)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // === LEVEL 2: Row bawah ===
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF26C6DA).withAlpha(26),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF26C6DA)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Color(0xFF26C6DA),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Container Level 2 — Full Width (Row + Icon + Text)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _SectionTitle(title: 'Struktur Hierarki Widget'),
            const SizedBox(height: 12),

            // Penjelasan hierarki
            _HierarchyItem(
              level: 0,
              label: 'Column (Root)',
              color: const Color(0xFF5C6BC0),
            ),
            _HierarchyItem(
              level: 1,
              label: 'Container Level 1',
              color: const Color(0xFF5C6BC0),
            ),
            _HierarchyItem(
              level: 2,
              label: 'Row (Level 2)',
              color: const Color(0xFF43A047),
            ),
            _HierarchyItem(
              level: 3,
              label: 'Container Kiri',
              color: const Color(0xFF43A047),
            ),
            _HierarchyItem(
              level: 3,
              label: 'Container Tengah',
              color: const Color(0xFFFF7043),
            ),
            _HierarchyItem(
              level: 4,
              label: 'Row (Level 4)',
              color: const Color(0xFFFF7043),
            ),
            _HierarchyItem(
              level: 3,
              label: 'Container Kanan',
              color: const Color(0xFF7E57C2),
            ),
            _HierarchyItem(
              level: 2,
              label: 'Container Full Width',
              color: const Color(0xFF26C6DA),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFF37474F),
      ),
    );
  }
}

class _HierarchyItem extends StatelessWidget {
  final int level;
  final String label;
  final Color color;

  const _HierarchyItem({
    required this.level,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: level * 20.0, bottom: 6),
      child: Row(
        children: [
          if (level > 0) ...[
            Icon(
              Icons.subdirectory_arrow_right,
              size: 16,
              color: Colors.grey[400],
            ),
            const SizedBox(width: 4),
          ],
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withAlpha(26),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withAlpha(102)),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
