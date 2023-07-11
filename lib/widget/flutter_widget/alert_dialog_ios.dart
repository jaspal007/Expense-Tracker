import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogIOS extends StatefulWidget {
  const AlertDialogIOS({
 super.key,
    required this.title,
    required this.content,
    required this.actions,
  });
  final String title;
  final String content;
  final List<String> actions;

  @override
  State<AlertDialogIOS> createState() => _AlertDialogIOSState();
}

class _AlertDialogIOSState extends State<AlertDialogIOS> {
  String get title => widget.title;
  String get content => widget.content;
  List<String> get actions => widget.actions;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: actions.map((value) {
        return TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(value),
        );
      }).toList(),
      title: Text(title),
      content: Text(content),
    );
  }
}
