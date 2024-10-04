import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text("${widget.userdetail.user!.email}"),
            Text("${widget.userdetail.user!.uid}"),
            ElevatedButton(
                onPressed: () async {
                  var signOut = await FirebaseAuth.instance.signOut();
                },
                child: Text("Signout"))
          ],
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
