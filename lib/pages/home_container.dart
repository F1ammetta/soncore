// Deprecated: This file is no longer in use.

import 'package:flutter/material.dart';
import 'package:soncore/pages/dashboard.dart';
import 'package:soncore/pages/home.dart';
import 'package:soncore/utils/server_interaction.dart';
import 'package:soncore/pages/start_page.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadClients(), 
      builder: (context, snapshot) {
        print(clients);
        return clients.isEmpty? const HomePage() : const Dashboard(child: StartPage());
      }
    );
  }
}