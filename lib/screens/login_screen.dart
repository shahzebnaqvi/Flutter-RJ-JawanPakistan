import 'package:containerapp/screens/animated_bottom_screen.dart';
import 'package:containerapp/screens/bottom_nav_screen.dart';
import 'package:containerapp/screens/home_screen.dart';
import 'package:containerapp/screens/todo_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  loginFunc(context) {
    print("hello world");
    print(emailControl.text);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => HomeScreen(
    //               email: emailControl.text,
    //             )));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => TodoScreen(
    //               email: emailControl.text,
    //             )));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AnimatedBottomScreen()));
    // emailControl.clear();
  }

  getPassword(passwordGet) {
    print("this is my text 2032 ${passwordGet}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          // width: 200,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              TextField(
                controller: emailControl,
                decoration: InputDecoration(label: Text("Email")),
              ),
              TextField(
                controller: passwordControl,
                onChanged: (abc) {
                  getPassword(abc);
                },
                decoration: InputDecoration(label: Text("Password")),
              ),
              ElevatedButton(
                onPressed: () {
                  loginFunc(context);
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
