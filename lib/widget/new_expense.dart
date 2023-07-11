//widget to validate and display fields to fill details of expense in the bottom sheet

import 'dart:io';

import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/modal/expense.dart';
import 'package:expense_tracker/widget/flutter_widget/alert_dialog_android.dart';
import 'package:expense_tracker/widget/flutter_widget/alert_dialog_ios.dart';
import 'package:expense_tracker/widget/flutter_widget/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/global_variables.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });
  final Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  DateTime? _dateTime = DateTime.now();
  Category _category = Category.work;

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => const AlertDialogIOS(
          title: 'Invalid Data',
          content: 'Please enter the correct data!',
          actions: ['OK'],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => const AlertDialogAndroid(
          title: 'Invalid Data',
          content: 'Please enter the correct data!',
          actions: ['OK'],
        ),
      );
    }
  }

  bool? submitExpenseData() {
    final enteredAmount = double.tryParse(_amount.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0;
    if (_title.text.trim().isEmpty || amountIsInvalid) {
      _showDialog();
      return false;
    }
    widget.onAddExpense(
      Expense(
          title: _title.text.trim(),
          amount: enteredAmount,
          date: _dateTime!,
          category: _category),
    );
    print('data saved');
    return true;
  }

  void _datePicker() async {
    final DateTime now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      if (pickedDate != null) {
        _dateTime = pickedDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        print(constraints.minWidth);
        print(constraints.maxWidth);
        print(constraints.minHeight);
        print(constraints.maxHeight);
        final width = constraints.maxWidth;

        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(32, 16, 32, keyboard + 16),
                child: Column(
                  children: [
                    if (width >= 600)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFieldInput(
                              controller: _title,
                              labelText: 'Expense Title',
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: TextFieldInput(
                                controller: _amount,
                                labelText: 'Expense Amount',
                                prefixText: '₹ ',
                                textInputType: TextInputType.number),
                          ),
                        ],
                      )
                    else
                      TextFieldInput(
                        controller: _title,
                        labelText: 'Expense Title',
                      ),
                    if (width >= 600)
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              value: _category,
                              items: Category.values.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value.name.toUpperCase()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  if (value != null) {
                                    _category = value;
                                  }
                                });
                              },
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formatted.format(_dateTime!),
                              ),
                              IconButton(
                                onPressed: _datePicker,
                                icon: const Icon(Icons.calendar_month_rounded),
                              ),
                            ],
                          ),
                        ],
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFieldInput(
                                controller: _amount,
                                labelText: 'Expense Amount',
                                prefixText: '₹ ',
                                textInputType: TextInputType.number),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formatted.format(_dateTime!),
                              ),
                              IconButton(
                                onPressed: _datePicker,
                                icon: const Icon(Icons.calendar_month_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    if (width >= 600)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final ans = submitExpenseData();
                              if (ans!) {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                kColorScheme.tertiary,
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                kColorScheme.primaryContainer,
                              ),
                            ),
                            child: const Text('Save'),
                          ),
                        ],
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            DropdownButton(
                              value: _category,
                              items: Category.values.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value.name.toUpperCase()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  if (value != null) {
                                    _category = value;
                                  }
                                });
                              },
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    final ans = submitExpenseData();
                                    if (ans!) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      kColorScheme.tertiary,
                                    ),
                                    foregroundColor: MaterialStateProperty.all(
                                      kColorScheme.primaryContainer,
                                    ),
                                  ),
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
