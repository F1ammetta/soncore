import 'package:flutter/material.dart';
import 'package:soncore/custom/playlist_list.dart';

class SideBar extends StatefulWidget {
  const SideBar({required this.compressSide, required this.width, super.key});
  
  final bool compressSide;
  final double width;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.width,
          width: widget.width,
          padding: widget.compressSide? const EdgeInsets.all(10) : const EdgeInsets.all(20),
          child: Image.asset('images/soncore.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: widget.compressSide? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            children: [
              widget.compressSide? const SizedBox() : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.library_music),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text('Library', style: Theme.of(context).primaryTextTheme.headlineMedium,),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {}, 
                icon: widget.compressSide? const Icon(Icons.library_add) : const Icon(Icons.add)
              )
            ],
          ),
        ),
        Container(
          child: PlaylistList(
            compressSide: widget.compressSide,
          ),
        )
      ],
    );
  }
}