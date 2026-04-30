import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  final List<_GridItem> _items = const [
    _GridItem(icon: Icons.flutter_dash, label: 'Flutter', color: Color(0xFF5C6BC0)),
    _GridItem(icon: Icons.phone_android, label: 'Mobile', color: Color(0xFF26A69A)),
    _GridItem(icon: Icons.brush, label: 'Design', color: Color(0xFFFF7043)),
    _GridItem(icon: Icons.code, label: 'Coding', color: Color(0xFF7E57C2)),
    _GridItem(icon: Icons.widgets_outlined, label: 'Widget', color: Color(0xFFEF5350)),
    _GridItem(icon: Icons.storage_outlined, label: 'Database', color: Color(0xFF29B6F6)),
    _GridItem(icon: Icons.api_outlined, label: 'API', color: Color(0xFF66BB6A)),
    _GridItem(icon: Icons.security_outlined, label: 'Security', color: Color(0xFFFF7043)),
    _GridItem(icon: Icons.cloud_outlined, label: 'Cloud', color: Color(0xFF42A5F5)),
    _GridItem(icon: Icons.analytics_outlined, label: 'Analytics', color: Color(0xFFAB47BC)),
    _GridItem(icon: Icons.psychology_outlined, label: 'AI / ML', color: Color(0xFF26C6DA)),
    _GridItem(icon: Icons.rocket_launch_outlined, label: 'Deploy', color: Color(0xFFFFCA28)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: const Text(
          'Grid View',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF5C6BC0).withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.grid_view, color: Color(0xFF5C6BC0), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    '${_items.length} item ditampilkan dalam 3 kolom',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5C6BC0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _GridCard(item: _items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridItem {
  final IconData icon;
  final String label;
  final Color color;
  const _GridItem({required this.icon, required this.label, required this.color});
}

class _GridCard extends StatefulWidget {
  final _GridItem item;
  const _GridCard({required this.item});

  @override
  State<_GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<_GridCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: widget.item.color.withAlpha(_isPressed ? 51 : 26),
              blurRadius: _isPressed ? 12 : 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: widget.item.color.withAlpha(_isPressed ? 102 : 38),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: widget.item.color.withAlpha(26),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                widget.item.icon,
                color: widget.item.color,
                size: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.item.label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF37474F),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
