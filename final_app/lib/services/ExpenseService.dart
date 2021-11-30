import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/ExpenseForm.dart';

abstract class Services {
  Future<List<Expense>> getExpense();
  Future<void> addExpense(
    int amount,
    String date,
    String detail,
    String type,
  );
}

class ExpenseServices extends Services {
  @override
  Future<List<Expense>> getExpense() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('final_expense').get();
    AllExpenses expense = AllExpenses.fromSnapshot(snapshot);
    return expense.expense;
  }

  @override
  Future<void> addExpense(
    int amount,
    String date,
    String detail,
    String type,
  ) async {
    final expenseRef = FirebaseFirestore.instance
        .collection('final_expense')
        .withConverter<Expense>(
            fromFirestore: (snapshot, _) => Expense.fromJson(snapshot.data()!),
            toFirestore: (expense, _) => expense.toJson());

    await expenseRef.add(
      Expense(amount, date, detail, type),
    );
  }
}
