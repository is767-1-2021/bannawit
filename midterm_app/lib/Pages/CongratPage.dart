import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/Model/Prize.dart';

class CongratPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'ยินดีด้วย',
            style: TextStyle(color: Colors.purple[500], fontSize: 24),
          ),
        ),
        backgroundColor: Colors.purple[50],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'ตรวจหวย',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'ข่าว',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'บัญชี',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/2");
              break;
            case 1:
              Navigator.pushNamed(context, "/3");
              break;
            case 2:
              Navigator.pushNamed(context, "/1");
              break;
            case 3:
              Navigator.pushNamed(context, "/7");
              break;
            case 4:
              Navigator.pushNamed(context, "/7");
              break;
            case 5:
              Navigator.pushNamed(context, "/7");
              break;
          }
        },
      ),
      body: Center(
        child: Container(
          height: 300.0,
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Center(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'ขอแสดงความยินดีด้วยจ้า หมายเลข ${form.lottoNo} ของคุณถูกรางวัล ',
                            style: TextStyle(fontSize: 40, color: Colors.grey),
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
