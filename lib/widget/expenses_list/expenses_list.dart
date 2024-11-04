import 'package:flutter/material.dart';

import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widget/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expense,
    required this.onRemoveExpense,
  });

  final List<Expense> expense;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expense[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expense[index]);
        },
        child: ExpenseItem(expense[index]),
      ),
    );
  }
}
