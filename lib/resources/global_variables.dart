import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Global variable resource of the Expense_Tracker file

import '../modal/expense.dart';

Map<BackgroundColors, Color> backGround = {
  BackgroundColors.yellow: const Color(0xFFFFE392),
  BackgroundColors.purple: const Color(0xFFE2C0E9),
  BackgroundColors.green: const Color(0xFFACE3AE),
  BackgroundColors.blue: const Color(0xFF9EC5E5),
  BackgroundColors.pink: const Color(0xFFE0AABC),
};

final formatted = DateFormat.yMMMd();

enum Category { food, travel, work, leisure }

enum BackgroundColors { yellow, purple, green, blue, pink }

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
