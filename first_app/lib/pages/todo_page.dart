import 'package:first_app/controllers/todo.dart';
import 'package:first_app/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todopage extends StatefulWidget {
  final TodoController controller;
  Todopage({required this.controller});

  @override
  _TodopageState createState() => _TodopageState();
}

class _TodopageState extends State<Todopage> {
  List<Todo> todos = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fectTodos();

    setState(() {
      todos = newTodos;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text('Tap button to fetch Todos');
            }

            return CheckboxListTile(
              onChanged: null,
              value: todos[index].completed,
              title: Text(todos[index].title),
            );
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }
}
