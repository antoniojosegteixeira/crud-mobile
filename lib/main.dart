import 'package:flutter/material.dart';
import 'package:softsul_mobile/features/crud/presentation/pages/home_page.dart';
import 'injection_container.dart' as dl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
