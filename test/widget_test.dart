// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_11/main.dart';

void main() {
  testWidgets('Dashboard smoke test', (WidgetTester tester) async {
    // Build app dan render frame pertama
    await tester.pumpWidget(const MyPortoApp());

    // Verifikasi AppBar title "MyPorto" muncul
    expect(find.text('MyPorto'), findsOneWidget);

    // Verifikasi teks subtitle dashboard muncul
    expect(find.text('Cek hasil karyaku disini:'), findsOneWidget);

    // Verifikasi semua 7 tombol menu muncul
    expect(find.text('Counter'), findsOneWidget);
    expect(find.text('Widget Bertingkat'), findsOneWidget);
    expect(find.text('User Input Example'), findsOneWidget);
    expect(find.text('Dynamic List Example'), findsOneWidget);
    expect(find.text('Navigasi Sederhana'), findsOneWidget);
    expect(find.text('Grid View'), findsOneWidget);
    expect(find.text('Tentang Saya'), findsOneWidget);
  });
}
