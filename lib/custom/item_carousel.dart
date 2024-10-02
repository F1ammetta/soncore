import 'package:flutter/material.dart';

class ItemCarousel extends StatefulWidget {
  const ItemCarousel({super.key, required this.title, required this.items, required this.itemSize});

  final String title;
  final List<dynamic> items;
  final double itemSize;

  @override
  State<ItemCarousel> createState() => _ItemCarouselState();
}

class _ItemCarouselState extends State<ItemCarousel> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).primaryTextTheme.headlineMedium,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset - 4*(widget.itemSize+10),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut
                      );
                    }, 
                    icon: const Icon(Icons.arrow_left_outlined)
                  ),
                  IconButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset + 4*(widget.itemSize+10),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut
                      );
                    }, 
                    icon: const Icon(Icons.arrow_right_outlined)
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          height: widget.itemSize + 50,
          padding: const EdgeInsets.all(5),
          child: Scrollbar(
            interactive: true,
            thickness: 5,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.items.map((item) {
                  return Container(
                    width: widget.itemSize,
                    height: widget.itemSize,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(item.toString(), style: Theme.of(context).primaryTextTheme.headlineMedium),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ),
      ],
    );
  }
}