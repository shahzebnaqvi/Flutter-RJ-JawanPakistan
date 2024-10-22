import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TodoWithApiScreen extends StatefulWidget {
  const TodoWithApiScreen({super.key});

  @override
  State<TodoWithApiScreen> createState() => _TodoWithApiScreenState();
}

class _TodoWithApiScreenState extends State<TodoWithApiScreen> {
  List todos = [];
  getData() async {
    String baseUrl = "https://jsonplaceholder.typicode.com/todos";
    Uri url = Uri.parse(baseUrl);
    http.Response responseTodo = await http.get(url);
    // print(abc.body[0]);
    if (responseTodo.statusCode == 200) {
      setState(() {
        todos = jsonDecode(responseTodo.body);
      });
      print(todos[0]);
    } else {
      print("something went wrong");
    }
  }

  postData(endpoint) async {
    String baseUrl = "https://jsonplaceholder.typicode.com$endpoint";
    var datapost = {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    };
    Uri url = Uri.parse(baseUrl);
    http.Response responseTodo =
        await http.post(url, body: jsonEncode(datapost));
    // print(abc.body[0]);
    if (responseTodo.statusCode == 201) {
      setState(() {
        print(responseTodo.body);
        // todos = jsonDecode(responseTodo.body);
      });
      print(todos[0]);
    } else {
      print("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text("data")),
          ElevatedButton(
              onPressed: () {
                postData("/posts");
              },
              child: Text("Post")),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text("${todos[i]["title"]}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
