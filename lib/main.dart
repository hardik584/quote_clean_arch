import 'package:flutter/material.dart';
import 'features/quote/presentation/pages/quote_page.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // Initialize the dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CLEAN Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuotePage(),
    );
  }
}
