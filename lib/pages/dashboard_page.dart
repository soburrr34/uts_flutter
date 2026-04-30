import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'widget_bertingkat_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'navigasi_sederhana_page.dart';
import 'grid_view_page.dart';
import 'tentang_saya_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? _activeIndex;

  final List<String> _labels = [
    'Counter',
    'Widget Bertingkat',
    'User Input Example',
    'Dynamic List Example',
    'Navigasi Sederhana',
    'Grid View',
    'Tentang Saya',
  ];

  void _navigateTo(BuildContext context, int index) {
    setState(() => _activeIndex = index);

    final pages = [
      const CounterPage(),
      const WidgetBertingkatPage(),
      const UserInputPage(),
      const DynamicListPage(),
      const NavigasiSederhanaPage(),
      const GridViewPage(),
      const TentangSayaPage(),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => pages[index]),
    ).then((_) {
      setState(() => _activeIndex = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: const Text(
          'MyPorto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cek hasil karyaku disini:',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF555555),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _labels.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final isActive = _activeIndex == index;
                  return _MenuButton(
                    label: _labels[index],
                    isActive: isActive,
                    onTap: () => _navigateTo(context, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _MenuButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = widget.isActive
        ? const Color(0xFF5C6BC0)
        : _isPressed
            ? const Color(0xFFBDBDBD)
            : const Color(0xFFD9D9D9);

    final Color textColor = widget.isActive ? Colors.white : const Color(0xFF333333);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
