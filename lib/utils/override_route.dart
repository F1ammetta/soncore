import 'package:flutter/material.dart';

class OverrideRoute extends MaterialPageRoute {
  OverrideRoute({super.settings, required this.child})
      : super(builder: (BuildContext context) => child);

  final Widget child;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return builder(context);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }
}