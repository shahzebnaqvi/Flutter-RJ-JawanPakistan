import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.blueGrey,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.yellow,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.blueGrey,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.yellow,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.yellow,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
    );
  }
}
