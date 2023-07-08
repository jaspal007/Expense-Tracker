//custom alert box for invalid data entry in the bottom sheet

import 'package:flutter/material.dart';

class AlertDialogBox extends StatefulWidget {
  const AlertDialogBox({
    super.key,
    required this.content,
    required this.actions,
  });
  final String content;
  final List<String> actions;
  @override
  State<AlertDialogBox> createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
  String get content => widget.content;
  List<String> get actions => widget.actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: actions.map((value) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 235, 209, 240),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(value),
        );
      }).toList(),
      content: Text(content),
    );
  }
}
