import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LottoNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Center(
          child: Text(
            'ข่าวสารเลขเด็ด',
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
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              height: 120,
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
                                minHeight: 120,
                                maxWidth: 120,
                                maxHeight: 120,
                              ),
                              child: Image.asset('assets/images/news1.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          ListTile(
                              title: Text(
                                'หวยแม่น้ำหนึ่ง! รีบหาซื้อก่อนหมดแผง',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text('กดเพื่อดูรายละเอียด'),
                              isThreeLine: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/5');
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 120,
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
                                  minHeight: 120,
                                  maxWidth: 120,
                                  maxHeight: 120,
                                ),
                                child: Image.asset('assets/images/news2.jpg',
                                    fit: BoxFit.cover)),
                          ),
                          ListTile(
                            title: Text(
                              'แม่จำเนียร งวดนี้ของแท้ อัพเดทก่อนใคร',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('กดเพื่อดูรายละเอียด'),
                            isThreeLine: true,
                            onTap: () {
                              Navigator.pushNamed(context, '/5');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 120,
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
                                minHeight: 120,
                                maxWidth: 120,
                                maxHeight: 120,
                              ),
                              child: Image.asset('assets/images/news3.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'ไอ้ไข่มาแรง สุดปัง 3 งวดติด ชาวบ้านแห่บูชา',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('กดเพื่อดูรายละเอียด'),
                            isThreeLine: true,
                            onTap: () {
                              Navigator.pushNamed(context, '/5');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 120,
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
                                minHeight: 120,
                                maxWidth: 120,
                                maxHeight: 120,
                              ),
                              child: Image.asset('assets/images/news4.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'ขันน้ำมนต์หลวงปู่ทวด ไม่เชื่อต้องดู',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('กดเพื่อดูรายละเอียด'),
                            isThreeLine: true,
                            onTap: () {
                              Navigator.pushNamed(context, '/5');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
