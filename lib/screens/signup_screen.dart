import 'package:containerapp/screens/animated_bottom_screen.dart';
import 'package:containerapp/utils/font_contraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          await firbaseinstance.createUserWithEmailAndPassword(
        email: emailControl.text,
        password: passwordControl.text,
      );
      var snackBar = SnackBar(
        content: Text('The account is created'),
      );
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      print("this is my signup output ${credential.user!.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        var snackBar = SnackBar(
          content: Text('The password provided is too weak.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          isloading = false;
        });
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        var snackBar = SnackBar(
          content: Text('The account already exists for this email.'),
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
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => AnimatedBottomScreen()));
    // emailControl.clear();
  }

  getPassword(passwordGet) {
    print("this is my text 2032 ${passwordGet}");
  }

  @override
  void initState() {
    emailControl.text = "shahzeb.naqvi12@gmail.com";
    passwordControl.text = "12345678";
    super.initState();
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
              Text(
                "Signup ",
                style: TextStyle(fontSize: FontConstraints.headingSize),
              ),
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
