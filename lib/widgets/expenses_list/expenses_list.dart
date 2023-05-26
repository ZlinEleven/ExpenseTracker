import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDismissedFunction});

  final List<Expense> expenses;
  final void Function(Expense) onDismissedFunction;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onDismissedFunction(expenses[index]);
          },
          child: ExpenseItem(
            expense: expenses[index],
          ),
        );
      },
    );
  }
}
