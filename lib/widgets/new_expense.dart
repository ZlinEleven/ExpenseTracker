import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpenseFunc});

  final void Function(Expense) addExpenseFunc;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _costController = TextEditingController();
  DateTime? _selectedDate;

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      print(_selectedDate);
      _selectedDate = pickedDate;
      print(_selectedDate);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _costController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? 'Select Date'
                        : dateFormatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () {
                        _openDatePicker();
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Expense expense = Expense(
                      title: _titleController.text,
                      amount: double.parse(_costController.text),
                      date: _selectedDate!,
                      category: Category.food);
                  widget.addExpenseFunc(expense);
                  Navigator.pop(context);
                },
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
