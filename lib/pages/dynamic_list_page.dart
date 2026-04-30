import 'package:flutter/material.dart';

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = [
    'Belajar Flutter 🚀',
    'Membuat UI kreatif 🎨',
    'Praktik Navigator 🗺️',
    'Eksplorasi Widget 🧩',
  ];

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() => _items.add(text));
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  void _removeItem(int index) {
    setState(() => _items.removeAt(index));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: const Text(
          'Dynamic List Example',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Chip(
              label: Text(
                '${_items.length}',
                style: const TextStyle(
                  color: Color(0xFF5C6BC0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Input tambah item
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tambah item baru...',
                      prefixIcon: const Icon(Icons.add_task, color: Color(0xFF5C6BC0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFFB0BEC5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFF5C6BC0), width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C6BC0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                    elevation: 3,
                  ),
                  child: const Icon(Icons.send_rounded, size: 22),
                ),
              ],
            ),
          ),

          // List
          Expanded(
            child: _items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 12),
                        Text(
                          'List masih kosong\nTambahkan item baru!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return _ListItemCard(
                        index: index,
                        text: _items[index],
                        onDelete: () => _removeItem(index),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ListItemCard extends StatelessWidget {
  final int index;
  final String text;
  final VoidCallback onDelete;

  const _ListItemCard({
    required this.index,
    required this.text,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF5C6BC0).withAlpha(26),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Color(0xFF5C6BC0),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF37474F),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Color(0xFFEF5350)),
          onPressed: onDelete,
          tooltip: 'Hapus item',
        ),
      ),
    );
  }
}
