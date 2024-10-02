import 'package:flutter/material.dart';
import 'package:soncore/custom/item_carousel.dart';
import 'package:soncore/utils/server_interaction.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: loadRecentPlaylists(),
            builder: (context, snapshot) {
              return ItemCarousel(
                title: 'Recent Playlists',
                items: snapshot.hasData? snapshot.requireData : recentPlaylists,
                itemSize: 200,
              );
            }
          )
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Placeholder(
            child: const Text('Recent Songs'),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Placeholder(
            child: const Text('Recent Albums'),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Placeholder(
            child: const Text('Recent Artists'),
          ),
        ),
      ],
    );
  }
}