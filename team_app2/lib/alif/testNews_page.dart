import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/controllers/newsController.dart';
import 'package:team_app/models/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestNewspage extends StatefulWidget {
  final NewsController controller;
  TestNewspage({required this.controller});

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<TestNewspage> {
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

  // navigateToDetail(NewsController controller) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => NewsModel(
  //                 news: news,
  //               )));
  // }

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
                                  // onTap: navigateToDetail(news[index]),
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

// class DetailNews extends StatefulWidget {
//   final NewsController controller;
//   DetailNews ({required this.controller});

//   @override
//   _DetailNewsState createState() => _DetailNewsState();
// }

// class _DetailNewsState extends State<DetailNews> {
//   List<NewsModel> news = List.empty();
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _getNews();

//     widget.controller.onSync
//         .listen((bool synState) => setState(() => isLoading = synState));
//   }

//   void _getNews() async {
//     var newNews = await widget.controller.fectNews();

//     setState(() {
//       news = newNews;
//     });
//   }

//   Widget get body => ListView.builder(
//           itemCount: news.isEmpty ? 1 : news.length,
//           itemBuilder: (context, index) {
//             if (news.isEmpty) {
//               return Text('No Data');
//             }

//             return Card(
//               child: Container(
//                 height: 120,
//                 child: Column(
//                   children: <Widget>[
//                     Table(
//                       children: [
//                         TableRow(
//                           children: [
//                             Container(
//                               child: ConstrainedBox(
//                                 constraints: BoxConstraints(
//                                   minWidth: 120,
//                                   minHeight: 120,
//                                   maxWidth: 120,
//                                   maxHeight: 120,
//                                 ),
//                                 child: ListTile(
//                                   leading: Image.asset(
//                                       'assets/images/' + news[index].image,
//                                       fit: BoxFit.cover),
//                                   title: Text(news[index].header),
//                                   subtitle: Text(news[index].newsDetail),
                                 
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Detail'),
//       ),
//       body: Center(
//         child: body,
//       ),
//     );
//   }
// }