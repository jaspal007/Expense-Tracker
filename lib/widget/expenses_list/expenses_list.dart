//Widget that returns the expense list on the main screen

import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../modal/expense.dart';

class ExpensesList extends StatefulWidget {
  final List<Expense> data;
  const ExpensesList({
    super.key,
    required this.data,
    required this.onRemoveExpense,
  });
  final Function(Expense expense) onRemoveExpense;
  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  List<Expense> get _data => widget.data; //getter function

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(_data[index].id),
          onDismissed: (direction) => widget.onRemoveExpense(_data[index]),
          child: ExpensesItem(item: _data[index]),
        ),
        itemCount: _data.length,
      ),
    );
  }
}
