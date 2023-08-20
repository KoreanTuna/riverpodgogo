import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  const DefaultLayout(
      {required this.title, required this.body, this.actions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: body,
        ));
  }
}
