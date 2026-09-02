import 'package:flutter/material.dart';
import 'package:pitik/src/config/config.dart';
import 'package:pitik/src/config/config_enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.setEnvironment(Flavors.development);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World Development!'))),
    );
  }
}
