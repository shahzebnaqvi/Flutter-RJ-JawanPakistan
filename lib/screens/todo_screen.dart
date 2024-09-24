import 'package:containerapp/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  String email;

  TodoScreen({super.key, required this.email});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int counter = 0;
  List todo_Title = ["class", "job", "lunch"];
  TextEditingController todotitle = TextEditingController();
  bool addedit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // Container(
              //   height: 700,
              //   child: ListView.builder(
              //       itemCount: todo_Title.length,
              //       itemBuilder: (context, ind) {
              //         return ProductWidget(productPrice: "${todo_Title[ind]}");
              //       }),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: todo_Title.length,
              //       itemBuilder: (context, ind) {
              //         return ProductWidget(productPrice: "${todo_Title[ind]}");
              //       }),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: todo_Title.length,
              //       itemBuilder: (context, ind) {
              //         return ProductWidget(productPrice: "${todo_Title[ind]}");
              //       }),
              // ),
              // Text("data"),
              // Text("data"),
              // Text("data"),
              // Text("data"),
              Row(
                children: [
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text("Todo"), hintText: "Task"),
                      controller: todotitle,
                    ),
                  ),
                  addedit
                      ? ElevatedButton(
                          child: Text("Add"),
                          onPressed: () {
                            if (todotitle.text != "") {
                              todo_Title.add("${todotitle.text}");
                              print(todo_Title);
                              setState(() {});
                            } else {
                              print("Empty todo task ");
                            }
                          },
                        )
                      : ElevatedButton(
                          child: Text("Edit"),
                          onPressed: () {
                            if (todotitle.text != "") {
                              setState(() {});
                            } else {
                              print("Empty todo task ");
                            }
                          },
                        )
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: todo_Title.length,
                  itemBuilder: (context, ind) {
                    return InkWell(
                      child: ProductWidget(productPrice: "${todo_Title[ind]}"),
                      onTap: () {
                        addedit = !addedit;
                        setState(() {});
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          counter++;
          print(counter);
        },
        child: Icon(Icons.add),
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
