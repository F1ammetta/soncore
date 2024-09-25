import 'package:flutter/material.dart';
import '../utils/server_interaction.dart';

class ArtistsList extends StatefulWidget {
  const ArtistsList({super.key, required this.compressSide});

  final bool compressSide;

  @override
  State<ArtistsList> createState() => _ArtistsListState();
}

class _ArtistsListState extends State<ArtistsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadArtists(),
      builder: (context, snapshot) {
        for (var artist in snapshot.data!) {
          print(artist.name);
        }
        return const Placeholder();
      },
    );
  }
}