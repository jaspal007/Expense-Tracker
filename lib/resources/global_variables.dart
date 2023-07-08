import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modal/expense.dart';

final formatted = DateFormat.yMMMd();
enum Category { food, travel, work, leisure }

const categoryIcon = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
};

List<Expense> registeredExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 399,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Shopping',
      amount: 1599,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Family Nighout',
      amount: 809.15,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];