import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final int amount;
  final String date;
  final String detail;
  final String type;

  Expense(this.amount, this.date, this.detail, this.type);

  factory Expense.fromJson(
    Map<String, dynamic> json,
  ) {
    return Expense(
      json['amount'] as int,
      json['date'] as String,
      json['detail'] as String,
      json['type'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'date': date, 'detail': detail, 'type': type};
  }
}

class AllExpenses {
  final List<Expense> expense;
  AllExpenses(this.expense);

  factory AllExpenses.fromJson(List<dynamic> json) {
    List<Expense> expense;

    expense = json.map((index) => Expense.fromJson(index)).toList();

    return AllExpenses(expense);
  }

  // for convert snapshot ไปเปน todo ข้างบน
  factory AllExpenses.fromSnapshot(QuerySnapshot s) {
    List<Expense> expense = s.docs.map((DocumentSnapshot ds) {
      return Expense.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllExpenses(expense);
  }
}
