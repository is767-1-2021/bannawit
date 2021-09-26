import 'package:flutter/material.dart';
import 'package:team_app/Pages/CongratPage.dart';
import 'package:team_app/Pages/LottoNewsPage.dart';
import 'package:team_app/Pages/NewsPage.dart';
import 'package:team_app/Pages/CheckPage.dart';
import 'package:team_app/Pages/SorryPage.dart';
import 'package:team_app/Pages/third.dart';
import 'package:provider/provider.dart';

import 'Model/Prize.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CheckPrize(),
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
          '/1': (context) => LottoNewsPage(),
          '/2': (context) => CheckPage(),
          '/3': (context) => ThirdPage(),
          '/4': (context) => CongratPage(),
          '/5': (context) => NewsPage(),
          '/6': (context) => SorryPage(),
        });
  }
}
