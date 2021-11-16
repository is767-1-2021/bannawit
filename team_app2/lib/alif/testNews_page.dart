import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/controllers/cnews.dart';
import 'package:team_app/models/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Newspage extends StatefulWidget {
//   final NewsController controller;
//   Newspage({required this.controller});

//   @override
//   _NewspageState createState() => _NewspageState();
// }

// class _NewspageState extends State<Newspage> {
//   Future getNews() async {
//     var firestore = Firestore.instance;
//     QuerySnapshot qn = await firestore.collection('News').getDocuments();
//     return qn.documents;

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: getNews(),
//         builder: (_, snapshot){
//           if (snapshot.connectionState = ContectionState.waiting){
//             return Center(
//               child: Text('Loading'),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (_, index){
//                 return ListTile(
//                   title: Text(snapshot.data[index].data['header'])
//                 );

//               });
//           }
//         }
//         ),
//     );
//   }
// }

class Newspage extends StatefulWidget {
  final NewsController controller;
  Newspage({required this.controller});

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<NewsModel> news = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getNews();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getNews() async {
    var newNews = await widget.controller.fectNews();

    setState(() {
      news = newNews;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: news.isEmpty ? 1 : news.length,
          itemBuilder: (context, index) {
            if (news.isEmpty) {
              return Text('Tap button to fetch Lotto News');
            }

            return Card(
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
                                child: ListTile(
                                  leading: Image.asset(
                                      'assets/images/' + news[index].image,
                                      fit: BoxFit.cover),
                                  title: Text(news[index].header),
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
        title: Text('Test Lotto News'),
      ),
      body: Center(
        child: body,
      ),
    );
  }
}
