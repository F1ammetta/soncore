import 'package:flutter/material.dart';
import '../utils/server_interaction.dart';

class SourceForm extends StatefulWidget {
  const SourceForm({super.key});

  @override
  State<SourceForm> createState() => _SourceFormState();
}

class _SourceFormState extends State<SourceForm> {  
  final _formKey = GlobalKey<FormState>();

  final myControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    for (var controller in myControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: myControllers[0],
              decoration: InputDecoration(
                labelText: 'URL',
                labelStyle: Theme.of(context).primaryTextTheme.labelSmall
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: myControllers[1],
              decoration: InputDecoration(
                labelText: 'Client Name',
                labelStyle: Theme.of(context).primaryTextTheme.labelSmall
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: myControllers[2],
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: Theme.of(context).primaryTextTheme.labelSmall
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: myControllers[3],
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: Theme.of(context).primaryTextTheme.labelSmall
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  createClient(context, myControllers[0].text, myControllers[1].text, myControllers[2].text, myControllers[3].text);
                  for (var controller in myControllers) {
                    controller.clear();
                  }
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}