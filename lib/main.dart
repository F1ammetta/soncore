import 'package:flutter/material.dart';
import 'package:soncore/pages/dashboard.dart';
import 'package:soncore/pages/home.dart';
import 'package:soncore/pages/search_page.dart';
import 'package:soncore/pages/start_page.dart';
import 'package:soncore/themes/dark.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:soncore/utils/server_interaction.dart';

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
    return FutureBuilder(
      future: loadClients(), 
      builder: (context, snapshot) {
        print(clients);
        return MaterialApp(
          navigatorKey: navKey,
          title: 'Soncore',
          initialRoute: '/',
          // builder: (context, child) => clients.isEmpty? const HomePage() : Dashboard(child: child!),
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) => clients.isEmpty? const HomePage() : Dashboard(child: child!)),
              ],
            );
          },
          routes: {
            '/': (context) => const StartPage(),
            '/search': (context) => const SearchPage(),
          },
          theme: dark(),
        );
      }
    );
  }
}