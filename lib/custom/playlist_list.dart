import 'package:flutter/material.dart';
import 'package:soncore/custom/playlist_tile.dart';
import 'package:soncore/utils/server_interaction.dart';

class PlaylistList extends StatefulWidget {
  const PlaylistList({super.key, required this.compressSide});

  final bool compressSide;

  @override
  State<PlaylistList> createState() => _PlaylistListState();
}

class _PlaylistListState extends State<PlaylistList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadPlaylists(),
      builder: (context, snapshot) => snapshot.hasData? ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data!.length,
        prototypeItem: PlaylistTile(
          playlist: snapshot.data!.first,
          compressSide: widget.compressSide
        ),
        itemBuilder: (context, index) => PlaylistTile(
          playlist: snapshot.data![index],
          compressSide: widget.compressSide
        )
      ) : const SizedBox(),
    );
  }
}