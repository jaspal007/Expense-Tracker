//custom class to store all the data of a single expense

import 'package:uuid/uuid.dart';
import '../resources/global_variables.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id; //unique transaction id
  final String title; //title of the transaction
  final double
      amount; //amount of the transaction(double to accomodate the fractional transactions)
  final DateTime date; //date of the transaction
  final Category category; //category of the transaction

  String get formattedDate => formatted.format(date);
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
