import 'package:flutter/material.dart';
import 'package:soncore/pages/home_container.dart';
import 'package:soncore/themes/dark.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // usePathUrlStrategy();
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soncore',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeContainer(),
      },
      theme: dark(),
    );
  }
}