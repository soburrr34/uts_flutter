import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);
  void _reset() => setState(() => _counter = 0);

  Color get _counterColor {
    if (_counter > 0) return const Color(0xFF43A047);
    if (_counter < 0) return const Color(0xFFE53935);
    return const Color(0xFF5C6BC0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: const Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display card
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _counterColor.withAlpha(51),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(color: _counterColor.withAlpha(76), width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nilai Counter',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: _counterColor,
                    ),
                    child: Text('$_counter'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            // Tombol aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement
                _ActionButton(
                  icon: Icons.remove,
                  label: 'Kurang',
                  color: const Color(0xFFE53935),
                  onPressed: _decrement,
                ),
                const SizedBox(width: 16),
                // Reset
                _ActionButton(
                  icon: Icons.refresh,
                  label: 'Reset',
                  color: Colors.grey,
                  onPressed: _reset,
                ),
                const SizedBox(width: 16),
                // Increment
                _ActionButton(
                  icon: Icons.add,
                  label: 'Tambah',
                  color: const Color(0xFF43A047),
                  onPressed: _increment,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              _counter == 0
                  ? 'Mulai tekan tombol!'
                  : _counter > 0
                      ? 'Counter positif 🎉'
                      : 'Counter negatif 😅',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(18),
            elevation: 4,
            shadowColor: color.withAlpha(102),
          ),
          child: Icon(icon, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
