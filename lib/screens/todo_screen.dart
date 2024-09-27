import 'package:containerapp/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoScreen extends StatefulWidget {
  String email;

  TodoScreen({super.key, required this.email});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List<Map<String, String>> todoTaskList = [
    {
      "title": "Lunch",
      "description": "Lunch done by me",
    }
  ];
  TextEditingController titleControl = TextEditingController();
  TextEditingController descripControl = TextEditingController();
  bool isEdit = false;
  int editIndexNo = 0;
  clearAllField() {
    titleControl.clear();
    descripControl.clear();
  }

  addTodo() {
    if (titleControl.text != "" && descripControl.text != "") {
      setState(() {
        todoTaskList.add(
            {"title": titleControl.text, "description": descripControl.text});
      });
      clearAllField();
    }
  }

  deleteTodo(indexNo) {
    todoTaskList.removeAt(indexNo);
    setState(() {});
  }

  editTodo(indexNo, titleValue, descripValue) {
    setState(() {
      isEdit = true;
      editIndexNo = indexNo;
    });
    print("$indexNo, $titleValue, $descripValue");
    titleControl.text = titleValue;
    descripControl.text = descripValue;
  }

  cancelTodo() {
    setState(() {
      isEdit = false;
    });
    clearAllField();
  }

  updateTodo() {
    todoTaskList[editIndexNo] = {
      "title": titleControl.text,
      "description": descripControl.text
    };
    setState(() {});
    cancelTodo();
  }

  @override
  Widget build(BuildContext context) {
    print("object;");
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 100,
            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) => Text("data"),
            //   ),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) => Text("data"),
            //   ),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) => Text("data"),
            //   ),
            // ),
            // Text("data")
            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: 100,
            //   itemBuilder: (context, index) => Text("data"),
            // ),
            TextField(
              controller: titleControl,
              decoration: InputDecoration(hintText: "title"),
            ),
            TextField(
              controller: descripControl,
              decoration: InputDecoration(hintText: "Description"),
            ),

            isEdit
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            updateTodo();
                          },
                          child: Text("Update"),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            cancelTodo();
                          },
                          child: Text("Cancel"),
                        ),
                      ),
                    ],
                  )
                : Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        addTodo();
                      },
                      child: Text("Add"),
                    ),
                  ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: todoTaskList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text("${todoTaskList[index]['title']}"),
                subtitle: Text("${todoTaskList[index]['description']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          editTodo(index, todoTaskList[index]['title'],
                              todoTaskList[index]['description']);
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          deleteTodo(index);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// class TodoScreen extends StatelessWidget {
//   String email;

//   TodoScreen({super.key, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     print("20345 hello World shahzeb $email");
//     return const Scaffold();
//   }
// }
