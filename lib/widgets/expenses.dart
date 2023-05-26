import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void addExpense(Expense expense) {
    setState(() {
      _expenseList.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(
              addExpenseFunc: addExpense,
            ));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: GoogleFonts.lato(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 11, 97),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
              color: Colors.white),
        ],
      ),
      body: Column(
        children: [
          const Text("Expenses chart"),
          ExpensesList(expenses: _expenseList),
        ],
      ),
    );
  }
}
