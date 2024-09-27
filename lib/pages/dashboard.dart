import 'package:flutter/material.dart';
import 'package:soncore/custom/side_bar.dart';
import '../utils/server_interaction.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.child});

  final Widget child;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool _hideData = false;
  bool _compressSide = false;
  String _currentRoute = '/';

  double _sideBarSize = 250;

  // final TextEditingController _searchController = TextEditingController();
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();

    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width: _compressSide? _sideBarSize : _sideBarSize,
                  child: SideBar(
                    compressSide:  _compressSide,
                    width: _sideBarSize,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (navKey.currentState!.mounted && _currentRoute != '/') {
                                _currentRoute = '/';
                                navKey.currentState!.pushReplacementNamed('/');
                              }
                            },
                            icon: const Icon(Icons.home_filled),
                          ),
                          SearchBar(
                            focusNode: _searchFocusNode,
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                              minWidth: 200,
                              maxHeight: 50,
                            ),
                            onTap: () {
                              if (navKey.currentState!.mounted && _currentRoute != '/search') {
                                _currentRoute = '/search';
                                navKey.currentState!.pushReplacementNamed('/search', arguments: _searchFocusNode);
                              }
                            },
                            hintText: 'Search',
                            trailing: [
                              const Divider(
                                height: 20,
                                thickness: 2,
                              ),
                              IconButton(
                                onPressed: () {
                                  if (navKey.currentState!.mounted && _currentRoute != '/search') {
                                    _currentRoute = '/search';
                                    navKey.currentState!.pushReplacementNamed('/search', arguments: _searchFocusNode);
                                  }
                                },
                                icon: const Icon(Icons.search),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: widget.child,
                              ),
                            ),
                            Container(
                              width: _hideData? 0 : (MediaQuery.of(context).size.width - _sideBarSize)*1/4,
                              child: _hideData? null : Placeholder(),
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                )
              )
            ],
          ),
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _hideData = !_hideData;
                  });
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _compressSide = !_compressSide;
                    if (_compressSide) {
                      _sideBarSize = 80;
                    }
                    else {
                      _sideBarSize = 250;
                    }
                  });
                },
              )
            ],
          ),
        ],
      ), 
    );
  }
}