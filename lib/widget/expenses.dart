//Scaffold returning widget that displays the appBar and the expense list

import 'package:expense_tracker/widget/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/resources/global_variables.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

import '../modal/expense.dart';

// ignore: must_be_immutable
class Expenses extends StatefulWidget {
  Expenses({
    super.key,
    required this.backgroundColors,
    required this.onColorchange,
  });
  BackgroundColors backgroundColors;
  final Function onColorchange;
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      registeredExpense.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpense.indexOf(expense);
    setState(() {
      registeredExpense.remove(expense);
    });
    final SnackBar snackBar = SnackBar(
      content: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${expense.title} ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: 'has been deleted'),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpense.insert(expenseIndex, expense);
            });
          }),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text('Nothing to display');
    if (registeredExpense.isNotEmpty) {
      mainContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Chart(expenses: registeredExpense),
          ExpensesList(
            data: registeredExpense,
            onRemoveExpense: removeExpense,
          ),
        ],
      );
    }

    void overlayView() {
      showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (ctx) => NewExpense(
          onAddExpense: addExpense,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            initialValue: widget.backgroundColors,
            itemBuilder: (context) => BackgroundColors.values
                .map(
                  (value) => PopupMenuItem(
                    value: value,
                    child: Text(
                      value.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            icon: const Icon(Icons.format_paint),
            onSelected: (value) {
              setState(() {
                widget.backgroundColors = value;
              });
              widget.onColorchange();
            },
          ),
        ],
        title: const Text('Expense Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: mainContent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: overlayView,
        child: const Icon(Icons.add),
      ),
    );
  }
}
