import 'dart:async';

import 'package:team_app/models/news_model.dart';
import 'package:team_app/services/newsServices.dart';

class NewsController {
  final Services service;
  List<NewsModel> news = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  NewsController(this.service);

  Future<List<NewsModel>> fectNews() async {
    onSyncController.add(true);
    news = await service.getNews();
    onSyncController.add(false);
    return news;
  }
}

// class TodoController {
//   final Services service;
//   List<Todo> todos = List.empty();

//   StreamController<bool> onSyncController = StreamController();
//   Stream<bool> get onSync => onSyncController.stream;

//   TodoController(this.service);

//   Future<List<Todo>> fectTodos() async {
//     onSyncController.add(true);
//     todos = await service.getTodos();
//     onSyncController.add(false);
//     return todos;
//   }
// }
