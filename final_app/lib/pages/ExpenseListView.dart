import 'package:flutter/material.dart';
import 'package:final_app/controllers/ExpenseController.dart';
import 'package:final_app/pages/ExpenseForm.dart';
import 'package:final_app/model/ExpenseForm.dart';
import 'package:final_app/services/ExpenseService.dart';
import 'package:table_calendar/table_calendar.dart';

class ExpenseListview extends StatefulWidget {
  @override
  _ExpenseListviewState createState() => _ExpenseListviewState();
}

class _ExpenseListviewState extends State<ExpenseListview> {
  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<Expense> expense = List.empty();
  bool isLoading = false;

  var service = ExpenseServices();
  var controller;

  _ExpenseListviewState() {
    controller = ExpenseController(service);
  }

  var children;

  @override
  void initState() {
    super.initState();
    _getexpense();

    controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getexpense() async {
    var newExpense = await controller.fectExpense();

    setState(() {
      expense = newExpense;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: expense.isEmpty ? 1 : expense.length,
          itemBuilder: (context, index) {
            if (expense.isEmpty) {
              return Text('No Expense');
            }

            return Card(
              child: Container(
                height: 80,
                child: Column(
                  children: <Widget>[
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 120,
                                  minHeight: 80,
                                  maxWidth: 120,
                                  maxHeight: 80,
                                ),
                                child: ListTile(
                                  title: Text(
                                    '฿' + expense[index].amount.toString(),
                                  ),
                                  subtitle: Text(
                                    expense[index].detail,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  leading: Image.asset(
                                      'assets/images/' +
                                          expense[index].type +
                                          '.png',
                                      fit: BoxFit.cover),
                                  // Icon(Icons.notification_add_outlined),
                                  tileColor: Colors.green[100],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Balance: ฿7000')),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ExpenseInput()));
        },
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            child: TableCalendar(
              calendarFormat: CalendarFormat.week,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: selectedDay,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  selectedDecoration: BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle)),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_upward),
                            Column(
                              children: [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\฿15000',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_downward),
                            Column(
                              children: [
                                Text(
                                  'Expense',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\฿8000',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 450,
            child: Center(
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
