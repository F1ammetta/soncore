import 'package:flutter/material.dart';
import 'package:soncore/custom/side_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool _hideData = false;
  bool _compressSide = false;

  double _sideBarSize = 250;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: 60,
                      child: const Placeholder(),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Placeholder(),
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