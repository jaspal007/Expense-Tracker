//custom alert box for invalid data entry in the bottom sheet

import 'package:flutter/material.dart';

class AlertDialogAndroid extends StatefulWidget {
  const AlertDialogAndroid({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });
  final String title;
  final String content;
  final List<String> actions;
  @override
  State<AlertDialogAndroid> createState() => _AlertDialogAndroidState();
}

class _AlertDialogAndroidState extends State<AlertDialogAndroid> {
  String get title => widget.title;
  String get content => widget.content;
  List<String> get actions => widget.actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: actions.map((value) {
        return ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(value),
        );
      }).toList(),
      title: Text(title),
      content: Text(content),
    );
  }
}
