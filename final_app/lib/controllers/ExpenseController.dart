import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/ExpenseForm.dart';
import 'package:final_app/services/ExpenseService.dart';

class ExpenseController {
  final Services service;
  List<Expense> expense = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  ExpenseController(this.service);

  Future<List<Expense>> fectExpense() async {
    onSyncController.add(true);
    expense = await service.getExpense();
    onSyncController.add(false);
    return expense;
  }

  addExpense(
    int amount,
    String date,
    String detail,
    String type,
  ) async {
    await service.addExpense(amount, date, detail, type);
  }
}
