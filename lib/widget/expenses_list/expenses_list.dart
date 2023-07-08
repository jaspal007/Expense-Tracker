import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../modal/expense.dart';

class ExpensesList extends StatefulWidget {
  final List<Expense> data;
  const ExpensesList({
    super.key,
    required this.data,
  });

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  List<Expense> get _data => widget.data; //getter function

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => ExpensesItem(item: _data[index]),
        itemCount: _data.length,
      ),
    );
  }
}
