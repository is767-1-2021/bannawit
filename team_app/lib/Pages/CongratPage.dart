import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/Model/Prize.dart';

class CongratPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'ยินดีด้วยจ้า',
          style: TextStyle(color: Colors.purple[500], fontSize: 24),
        )),
        backgroundColor: Colors.purple[50],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'ตรวจรางวัล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'การแจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'บัญชีของฉัน',
          ),
        ],
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
