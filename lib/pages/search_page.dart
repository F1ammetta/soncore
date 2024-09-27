import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var _searchFocusNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchFocusNode = ModalRoute.of(context)!.settings.arguments;
     
    final action = Future.delayed(const Duration(milliseconds: 5), () {
      _searchFocusNode.requestFocus();
    });

    return FutureBuilder(
      future: action,
      builder: (context, snapshot) => const Placeholder(
        child: Text('Search Page'),
      ),
    );
  }
}