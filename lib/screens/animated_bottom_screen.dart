import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimatedBottomScreen extends StatefulWidget {
  UserCredential userdetail;
  AnimatedBottomScreen({super.key, required this.userdetail});

  @override
  State<AnimatedBottomScreen> createState() => _AnimatedBottomScreenState();
}

class _AnimatedBottomScreenState extends State<AnimatedBottomScreen> {
  List<IconData> iconList = [
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];
  int _bottomNavIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List productsData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> productData = {
                      "id": 1,
                      "productname": "watch",
                      "productcat": "a",
                      "productprice": 20,
                      "productimage": "abc"
                    };
                    await firestore.collection("Products").add(productData);
                  },
                  child: Text("Add Product")),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productsData.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text("${productsData[index]["productname"] ?? ''}"),
                  subtitle: Text("${productsData[index]['productprice']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            // editTodo(index, todoTaskList[index]['title'],
                            //     todoTaskList[index]['description']);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            // deleteTodo(index);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              ),
              // Crud Create read update delete

              ElevatedButton(
                  onPressed: () async {
                    var products = await firestore.collection("Products").get();
                    print(products.docs);
                    setState(() {
                      productsData = products.docs;
                    });
                  },
                  child: Text("Get  Product"))
              // SizedBox(
              //   height: 200,
              // ),
              // Text("${widget.userdetail.user!.email}"),
              // Text("${widget.userdetail.user!.uid}"),
              // ElevatedButton(
              //     onPressed: () async {
              //       var signOut = await FirebaseAuth.instance.signOut();
              //     },
              //     child: Text("Signout"))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
