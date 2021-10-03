import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Home',
          style: TextStyle(color: Colors.purple[500], fontSize: 24),
        )),
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
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.money),
                title: Text(
                  'ตรวจรางวัลของท่าน',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/2');
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.book_online),
                title: Text(
                  'ข่าวเลขเด็ด',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/3');
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'หน้าหลัก',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/1');
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.card_travel),
                title: Text(
                  'คำสั่งซื้อ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/7');
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.notifications),
                title: Text(
                  'แจ้งเตือน',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/7');
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  'บัญชีผู้ใช้งาน',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/7');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
