import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_app/Pages/LottoList.dart';
import 'package:midterm_app/Model/Prize.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final _formKey = GlobalKey<FormState>();
  String? _lottoNo;

  List<LottoList> NoList = [
    LottoList('รางวัลที่ 1', '145621'),
    LottoList('เลขหน้า 3 ตัว', '118 309'),
    LottoList('เลขท้าย 3 ตัว', '143 716'),
    LottoList('เลขท้าย 2 ตัว', '12'),
    LottoList('รางวัลที่ 2', '123456  123456  123456  123456  123456'),
    LottoList('รางวัลที่ 3',
        '123456  123456  123456  123456  123456  123456  123456  123456  123456  123456'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Center(
            child: Text(
          'ตรวจหวยจ้า',
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
      body: Center(
        child: Column(
          children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }

  _form() => Container(
        color: Colors.purple[100],
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'ตรวจสลากของท่าน'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'โปรดใส่เลขสลากของท่าน';
                    } else if (value.length != 6) {
                      return 'หมายเลขต้องมีความยาว 6 ตัว';
                    } else if (value == '145621') {
                      Navigator.pushNamed(
                        context,
                        '/4',
                      );
                    } else if (value.substring(0, 3) == '118' ||
                        value.substring(0, 3) == '309') {
                      Navigator.pushNamed(context, '/4');
                    } else if (value.substring(3, 6) == '143' ||
                        value.substring(3, 6) == '716') {
                      Navigator.pushNamed(context, '/4');
                    } else if (value.substring(4, 6) == '12') {
                      Navigator.pushNamed(context, '/4');
                    } else if (value != '145621') {
                      Navigator.pushNamed(context, '/6');
                    }
                  },
                  onSaved: (value) {
                    _lottoNo = value;
                  },
                  initialValue: context.read<FirstFormModel>().lottoNo,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<FirstFormModel>().lottoNo = _lottoNo;
                    }
                  },
                  child: Text('ตรวจ'),
                  style: ElevatedButton.styleFrom(primary: Colors.purple[200]),
                ),
              ),
            ],
          ),
        ),
      );

  _list() => Expanded(
        child: Card(
          color: Colors.purple[100],
          margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                LottoList huay = NoList[index];
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Center(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: Text(
                            huay.name,
                            style: TextStyle(
                                color: Colors.purple[500],
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25.0, right: 25, top: 8, bottom: 8),
                          child: Text(
                            huay.prize,
                            style: TextStyle(
                                color: Colors.purple[500], fontSize: 22),
                          ),
                        ),
                      ),
                      isThreeLine: true,
                      onTap: () {},
                    ),
                    Divider(
                      height: 5.0,
                    ),
                  ],
                );
              },
              itemCount: NoList.length,
            ),
          ),
        ),
      );
}
