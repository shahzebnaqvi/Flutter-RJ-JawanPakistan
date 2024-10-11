import 'package:containerapp/screens/animated_bottom_screen.dart';
import 'package:containerapp/screens/bottom_nav_screen.dart';
import 'package:containerapp/screens/home_screen.dart';
import 'package:containerapp/screens/signup_screen.dart';
import 'package:containerapp/screens/todo_screen.dart';
import 'package:containerapp/screens/todo_screen_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();

  TextEditingController passwordControl = TextEditingController();

  bool isloading = false;

  loginFunc(context) async {
    print("hello world");
    print(emailControl.text);
    print(passwordControl.text);
    setState(() {
      isloading = true;
    });

    try {
      var firbaseinstance = FirebaseAuth.instance;
      UserCredential credential =
          await firbaseinstance.signInWithEmailAndPassword(
        email: emailControl.text,
        password: passwordControl.text,
      );
      var snackBar = SnackBar(
        content: Text('The account is login ${credential.user!}'),
      );
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             AnimatedBottomScreen(userdetail: credential)));

      print("this is my signup output ${credential.user!.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
        var snackBar = SnackBar(
          content: Text('No user found for that email'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          isloading = false;
        });
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        var snackBar = SnackBar(
          content: Text('Wrong password provided for that user.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          isloading = false;
        });
      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');
        var snackBar = SnackBar(
          content: Text('User not exist.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          isloading = false;
        });
      } else {
        var snackBar = SnackBar(
          content: Text('${e.code}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          isloading = false;
        });
      }
    } catch (error) {
      print(error);
      var snackBar = SnackBar(
        content: Text('error : ${error}'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      setState(() {
        isloading = false;
      });
    }

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
              SizedBox(
                height: 10,
              ),
              isloading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        // loginFunc(context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodoScreenFirebase()));
                      },
                      child: Text("Login"),
                    ),
              Row(
                children: [
                  Text("Did not have account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: Text("Sign up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
