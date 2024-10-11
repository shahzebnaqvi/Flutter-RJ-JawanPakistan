import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoScreenFirebase extends StatefulWidget {
  const TodoScreenFirebase({super.key});

  @override
  State<TodoScreenFirebase> createState() => _TodoScreenFirebaseState();
}

class _TodoScreenFirebaseState extends State<TodoScreenFirebase> {
  TextEditingController taskNameControl = TextEditingController();
  TextEditingController taskProirtyControl = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List taskList = [];
  Future getTask() async {
    return await firestore.collection("Task").get();
  }

  @override
  void initState() async {
    // TODO: implement initState
    var task = await getTask();
    print(task.docs);
    setState(() {
      taskList = task.docs;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    var task = await getTask();
                    print(task.docs);
                    setState(() {
                      taskList = task.docs;
                    });
                  },
                  child: Icon(Icons.refresh)),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text("${taskList[index]["TaskName"]}"),
                    leading: Text("abc"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () async {
                              print("${taskList[index]["TaskName"]}");
                              print("${taskList[index].id}");
                              firestore
                                  .collection("Task")
                                  .doc("${taskList[index].id}")
                                  .update({
                                "TaskName": "YAseen",
                                "Priorty": "High"
                              });
                              var task = await getTask();
                              print(task.docs);
                              setState(() {
                                taskList = task.docs;
                              });
                            },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            onTap: () async {
                              print("${taskList[index]["TaskName"]}");
                              print("${taskList[index].id}");
                              firestore
                                  .collection("Task")
                                  .doc("${taskList[index].id}")
                                  .delete();
                              var task = await getTask();
                              print(task.docs);
                              setState(() {
                                taskList = task.docs;
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration:
                                InputDecoration(label: Text("TaskName")),
                            controller: taskNameControl,
                          ),
                          TextField(
                            decoration: InputDecoration(label: Text("Priorty")),
                            controller: taskProirtyControl,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (taskNameControl.text != "" &&
                                    taskProirtyControl.text != "") {
                                  firestore.collection("Task").add({
                                    "TaskName": taskNameControl.text,
                                    "Priorty": taskProirtyControl.text
                                  }).then((value) {
                                    firestore.collection("TaskID").add({
                                      "TaskID": value.id,
                                      "Date": DateTime.now()
                                    });
                                    print("2032 ${value.id}");
                                  });
                                  taskNameControl.clear();
                                  taskProirtyControl.clear();
                                  var task = await getTask();
                                  print(task.docs);
                                  setState(() {
                                    taskList = task.docs;
                                  });
                                  Navigator.pop(context);
                                } else {
                                  var snackBar = SnackBar(
                                    content: Text('the field are empty'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Text("Add Task"))
                        ],
                      ),
                    );
                  });
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
