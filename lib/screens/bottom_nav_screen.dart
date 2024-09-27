import 'package:containerapp/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentPageIndex = 0;
  List dashboardScreen = [
    // Container(
    //   color: Colors.yellow,
    // )
    HomeNewScreen(),
    TodoScreen(
      email: "sddookdo",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: dashboardScreen[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "call")
        ],
        currentIndex: currentPageIndex,
        onTap: (value) {
          print(value);
          currentPageIndex = value;
          setState(() {});
        },
        selectedItemColor: Colors.red,
      ),
    );
  }
}

class HomeNewScreen extends StatelessWidget {
  const HomeNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(100),
            // margin: EdgeInsets.all(100),
            width: 100,
            height: 200,
            color: Colors.purple,
          ),
          // Positioned(
          //   top: 10,
          //   right: -100,
          //   child: Container(
          //     width: 50,
          //     height: 200,
          //     color: Colors.yellow,
          //   ),
          // ),
          Container(
            width: 50,
            height: 100,
            color: Colors.yellow,
          ),
          Container(
            width: 40,
            height: 80,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
