import 'package:flutter/material.dart';
import 'package:midterm_app/Pages/BlankPage.dart';
import 'package:midterm_app/Pages/CheckPages.dart';
import 'package:midterm_app/Pages/CongratPage.dart';
import 'package:midterm_app/Pages/Home.dart';
import 'package:midterm_app/Pages/NewsListPage.dart';
import 'package:midterm_app/Pages/NewsPage.dart';
import 'package:midterm_app/Pages/SorryPage.dart';
import 'package:provider/provider.dart';

import 'Model/Prize.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.lightBlue,
          accentColor: Colors.amber,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.purple),
          )),
      initialRoute: '/1',
      routes: <String, WidgetBuilder>{
        '/1': (context) => HomePage(),
        '/2': (context) => CheckPage(),
        '/3': (context) => LottoNewsPage(),
        '/4': (context) => CongratPage(),
        '/5': (context) => NewsPage(),
        '/6': (context) => SorryPage(),
        '/7': (context) => BlankPage(),
      },
    );
  }
}
