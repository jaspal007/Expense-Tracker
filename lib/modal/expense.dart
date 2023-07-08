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
