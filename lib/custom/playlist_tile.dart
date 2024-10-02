import 'package:flutter/material.dart';
import 'package:soncore/utils/server_interaction.dart';

class PlaylistTile extends StatefulWidget {
  const PlaylistTile({super.key, required this.playlist, required this.compressSide});

  final AppPlaylist playlist;
  final bool compressSide;

  @override
  State<PlaylistTile> createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addPlaylistToRecent(widget.playlist);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Container(
          width: widget.compressSide? 60 : 180,
          height: 60,
          child:  widget.compressSide? CoverArt(client: widget.playlist.client, coverId: widget.playlist.coverArt, size: 60)
            : Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CoverArt(client: widget.playlist.client, coverId: widget.playlist.coverArt, size: 60),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.playlist.name, style: Theme.of(context).primaryTextTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis),
                        Text('Playlist | ${widget.playlist.songCount} Songs', style: Theme.of(context).primaryTextTheme.labelSmall)
                      ],
                    ),
                  ),
                )
              ],
            ),
          
        ),
      ),
    );
  }
}