import 'package:containerapp/screens/product_screen.dart';
import 'package:containerapp/utils/color_contraints.dart';
import 'package:containerapp/utils/font_contraints.dart';
import 'package:containerapp/widgets/product_widget.dart';
import 'package:containerapp/widgets/round_corner_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.withOpacity(0.1),
      bottomNavigationBar: Container(
        height: 60,
        // width: 20,
        color: Colors.blue,
      ),
      body: Container(
        color: Colors.green.withOpacity(0.2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text("dsd"),
                subtitle: Text("DSs"),
                trailing: Text("dsds"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://img.drz.lazcdn.com/static/pk/p/8ce3e007e5d4f7bfc0dfc00bf5c06970.jpg_720x720q80.jpg_.webp"),
                ),
              ),
              // Rs. 1,299"
              ElevatedButton(
                onPressed: () {
                  // print("object $context");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(),
                      ));
                },
                child: Text("data"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print("object");
                },
                icon: Icon(Icons.wallet),
                label: Text("data"),
              ),
              TextButton(
                  onPressed: () {
                    print("This is text button");
                  },
                  child: Text("Text Button")),
              TextButton.icon(
                onPressed: () {
                  print("This is text button");
                },
                icon: Icon(Icons.ac_unit_sharp),
                label: Text("Text Icon Button"),
              ),
              IconButton(
                  onPressed: () {
                    print("This is text button");
                  },
                  icon: Icon(Icons.access_alarm_rounded)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      child: ProductWidget(productPrice: "Rs. 1,322"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProductScreen(),
                        //   ),
                        // );
                        print("gesture");
                      },
                    ),
                    InkWell(
                      child: ProductWidget(productPrice: "Rs. 1,322"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProductScreen(),
                        //   ),
                        // );
                        print("inkwell");
                      },
                    ),
                    ProductWidget(productPrice: "Rs. 1,322"),
                    ProductWidget(productPrice: "Rs. 1,322"),
                    ProductWidget(productPrice: "Rs. 1,322"),
                  ],
                ),
              ),
              productWidget(productPrice: "Rs. 1,322"),
              // Image.asset("assets/images/profile.jpeg"),
              Image.network(
                  "https://img.drz.lazcdn.com/static/pk/p/8ce3e007e5d4f7bfc0dfc00bf5c06970.jpg_720x720q80.jpg_.webp"),
              RoundCornerContainer(
                  containerColor: Colors.blue, containerTest: "Hello World"),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.yellow, Colors.red]),
                    // color: Colors.yellow,
                    border: Border.all(
                      color: Colors.green,
                      width: 20,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  width: 300,
                  height: 300,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.green,
                      width: 20,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  width: 300,
                  height: 300,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.green,
                      width: 20,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  width: 300,
                  height: 300,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.green,
                      width: 20,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
    );
  }
}
