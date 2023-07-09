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
          background: Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: ShapeDecoration(
              shape: Theme.of(context).cardTheme.shape!,
              color: Theme.of(context)
                  .colorScheme
                  .error
                  .withRed(83)
                  .withGreen(145)
                  .withBlue(101),
            ),
            margin: Theme.of(context).cardTheme.margin,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.edit_note_rounded,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            padding: const EdgeInsets.only(right: 10),
            decoration: ShapeDecoration(
              shape: Theme.of(context).cardTheme.shape!,
              color: Theme.of(context)
                  .colorScheme
                  .error
                  .withRed(255)
                  .withBlue(10)
                  .withGreen(10),
            ),
            margin: Theme.of(context).cardTheme.margin,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete_sweep,
              color: Colors.white,
            ),
          ),
          key: ValueKey(_data[index].id),
          onDismissed: (direction) => widget.onRemoveExpense(_data[index]),
          child: ExpensesItem(item: _data[index]),
        ),
        itemCount: _data.length,
      ),
    );
  }
}
