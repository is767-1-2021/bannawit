import 'package:flutter/material.dart';
import 'package:final_app/controllers/ExpenseController.dart';
import 'package:final_app/pages/ExpenseListView.dart';
import 'package:final_app/services/ExpenseService.dart';

class ExpenseInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Entry'),
        backgroundColor: Colors.green,
      ),
      body: InputForm(),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  int? amount;
  String date = '';
  String detail = '';
  String type = '';

  var service = ExpenseServices();
  var controller;

  _InputFormState() {
    controller = ExpenseController(service);
  }

  _addExpense(int amount, String date, String detail, String type) async {
    await controller.addExpense(amount, date, detail, type);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุประเภทรายการ (expense/ income)',
              icon: Icon(Icons.notification_add_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้ระบุประเภทรายการ';
              }
              if (value != 'expense' && value != 'income') {
                return 'รายการใส่ได้เพียง income หรือ expense เท่านั้น';
              }
              return null;
            },
            onSaved: (value) {
              type = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุรายละเอียดรายการ',
              icon: Icon(Icons.notification_add_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้ระบุรายละเอียดรายการ';
              }
              return null;
            },
            onSaved: (value) {
              detail = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุจำนวนเงิน',
              icon: Icon(Icons.notification_add_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้ระบุจำนวนเงิน';
              }
              // if (value is String) {
              //   return 'โปรดระบุตัวเลขเท่านั้น';
              // }
              return null;
            },
            onSaved: (value) {
              amount = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุวันที่บันทึกรายการ',
              icon: Icon(Icons.notification_add_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้ระบุวันที่บันทึกรายการ';
              }
              return null;
            },
            onSaved: (value) {
              date = value!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              _addExpense(amount!, date, detail, type);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpenseListview(),
                ),
              );
            },
            child: Text('บันทึก'),
          ),
          IconButton(
            icon: Icon(
              Icons.home_max,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpenseListview(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
