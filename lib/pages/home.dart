import 'package:flutter/material.dart';
import 'package:soncore/custom/source_form.dart';
import 'package:soncore/pages/dashboard.dart';
import 'package:soncore/pages/start_page.dart';
import '../utils/server_interaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _openform = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 500,
                    height: _openform? 800 : 400,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _openform? 100 : 220,
                          height: _openform? 100 : 220,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('images/soncore.png')
                          )
                        ),
                        Text('Welcome', 
                          style: Theme.of(context).primaryTextTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: _openform? 300 : 0,
                          child: _openform? const SourceForm() : null,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        clients.isEmpty? IconButton(
                          onPressed: () {
                            setState(() {
                              _openform = !_openform;
                            });
                          },
                          icon: _openform? const Icon(Icons.close) : const Icon(Icons.add)
                        ) : IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context, 
                              MaterialPageRoute(builder: (context) => const Dashboard(
                                child: StartPage(),
                              )),
                              ModalRoute.withName('/')
                            );
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ],  
                    ),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('<Texto interesante o que de plano responde a cuestiones legales>', style: Theme.of(context).primaryTextTheme.labelSmall),
            ),
          ],
        ),
      ),
    );
  }
}