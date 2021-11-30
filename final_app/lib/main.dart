import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:final_app/pages/ExpenseForm.dart';
import 'pages/ExpenseListView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(
            color: Colors.green[200],
          ),
          fontFamily: 'Prompt',
          bottomAppBarColor: Colors.purple[200]),
      initialRoute: '/expense',
      routes: <String, WidgetBuilder>{
        '/expense': (context) => ExpenseListview(),
        '/input': (context) => ExpenseInput(),
      },
    );
  }
}
