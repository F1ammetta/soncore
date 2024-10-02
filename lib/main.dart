import 'package:flutter/material.dart';
import 'package:soncore/pages/dashboard.dart';
import 'package:soncore/pages/home.dart';
import 'package:soncore/pages/search_page.dart';
import 'package:soncore/pages/start_page.dart';
import 'package:soncore/themes/dark.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:soncore/utils/override_route.dart';
import 'package:soncore/utils/server_interaction.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
          return MaterialApp(
            navigatorKey: navKey,
            title: 'Soncore',
            initialRoute: '/',
            builder: (context, child) {
              return Overlay(
                initialEntries: [
                  OverlayEntry(
                      builder: (context) => clients.isEmpty
                          ? const HomePage()
                          : Dashboard(child: child!)),
                ],
              );
            },

            // Deprecated...
            // routes: {
            //   '/': (context) => const StartPage(),
            //   '/search': (context) => const SearchPage(),
            // },
            
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return OverrideRoute(
                      settings: settings, child: const StartPage());
                case '/search':
                  return OverrideRoute(
                      settings: settings, child: const SearchPage());
                default:
                  return OverrideRoute(
                      settings: settings, child: const StartPage());
              }
            },
            theme: dark(),
          );
        });
  }
}

