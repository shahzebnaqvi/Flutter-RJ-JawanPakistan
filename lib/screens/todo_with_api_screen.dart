import 'dart:convert';

import 'package:containerapp/models/todo_response_model.dart';
import 'package:containerapp/models/user_response_model.dart';
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
  List<TodosResponseModel> todos = [];
  getData() async {
    String baseUrl = "https://jsonplaceholder.typicode.com/todos";
    Uri url = Uri.parse(baseUrl);
    http.Response responseTodo = await http.get(url);
    // print(abc.body[0]);
    if (responseTodo.statusCode == 200) {
      setState(() {
        // todos = jsonDecode(responseTodo.body);

        for (var a in jsonDecode(responseTodo.body)) {
          todos.add(TodosResponseModel.fromJson(a));
          print("i am getting data $a");
        }
      });
      print(todos[0]);
    } else {
      print("something went wrong");
    }
  }

  List<UserResponseModel> users = [];
  getusersData() async {
    String baseUrl = "https://jsonplaceholder.typicode.com/users";
    Uri url = Uri.parse(baseUrl);
    http.Response responseTodo = await http.get(url);
    // print(abc.body[0]);
    if (responseTodo.statusCode == 200) {
      setState(() {
        // todos = jsonDecode(responseTodo.body);

        for (var a in jsonDecode(responseTodo.body)) {
          users.add(UserResponseModel.fromJson(a));
          print("i am getting data $a");
        }
      });
      print(todos[0]);
    } else {
      print("something went wrong");
    }
  }

  UserResponseModel usersdata1 = UserResponseModel();
  getusers1Data(nouser) async {
    String baseUrl = "https://jsonplaceholder.typicode.com/users/$nouser";
    Uri url = Uri.parse(baseUrl);
    http.Response responseTodo = await http.get(url);
    // print(abc.body[0]);
    if (responseTodo.statusCode == 200) {
      setState(() {
        // todos = jsonDecode(responseTodo.body);
        usersdata1 = UserResponseModel.fromJson(jsonDecode(responseTodo.body));
      });
      print(todos[0]);
    } else {
      print("something went wrong");
    }
  }

  postData(endpoint) async {
    String baseUrl = "https://jsonplaceholder.typicode.com$endpoint";
    var headers = {'Content-Type': 'application/json'};
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
        await http.post(url, headers: headers, body: jsonEncode(datapost));
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
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                getusersData();
              },
              child: Text("data")),
          ElevatedButton(
              onPressed: () {
                // postData("/posts");
                getusers1Data(1);
              },
              child: Text("Post")),
          Text("${usersdata1}"),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(users[i].address!.geo!.lat ?? "Not found"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
