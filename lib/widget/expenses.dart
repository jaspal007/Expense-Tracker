import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/resources/global_variables.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

import '../modal/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      registeredExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    void overlayView() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: addExpense,),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: overlayView,
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text('Expense Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The Chart'),
            ExpensesList(
              data: registeredExpense,
            ),
          ],
        ),
      ),
    );
  }
}
