import 'package:containerapp/widgets/round_corner_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        // width: 20,
        color: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RoundCornerContainer(
                containerColor: Colors.blue, containerTest: "Hello World"),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.yellow, Colors.red]),
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
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
    );
  }
}
