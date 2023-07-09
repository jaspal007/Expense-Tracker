//custom textfield for the bottom sheet

import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldInput extends StatefulWidget {
  TextFieldInput({
    super.key,
    required this.controller,
    this.textInputType,
    this.labelText,
    this.hintText,
    this.prefixText,
  });

  final TextEditingController controller;
  TextInputType? textInputType = TextInputType.text;
  String? labelText = '';
  String? hintText = '';
  String? prefixText = '';
  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  TextEditingController get controller => widget.controller;
  TextInputType? get textInputType => widget.textInputType;
  String? get labelText => widget.labelText;
  String? get hintText => widget.hintText;
  String? get prefixText => widget.prefixText;

  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _showClearButton = controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 50,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: kColorScheme.inversePrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: kColorScheme.inversePrimary, width: 2),
        ),
        prefixText: prefixText,
        prefixStyle: TextStyle(
            color: (ThemeMode.system == ThemeMode.light)
                ? kColorScheme.tertiary
                : kDarkColorScheme.tertiary),
        labelText: labelText,
        labelStyle: TextStyle(
            color: (ThemeMode.system == ThemeMode.light)
                ? kColorScheme.tertiary
                : kDarkColorScheme.tertiary),
        hintText: hintText,
        hintStyle: TextStyle(
            color: (ThemeMode.system == ThemeMode.light)
                ? kColorScheme.tertiary
                : kDarkColorScheme.tertiary),
        suffixIcon: _showClearButton
            ? IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
      keyboardType: textInputType,
    );
  }
}
