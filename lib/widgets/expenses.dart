import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenseList = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppBar(
              title: const Text("Expense Tracker"),
              backgroundColor: const Color.fromARGB(255, 43, 11, 97),
            ),
            const Text("Expenses chart"),
            ExpensesList(expenses: _expenseList),
          ],
        ),
      ),
    );
  }
}
