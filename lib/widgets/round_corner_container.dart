import 'package:flutter/material.dart';

Widget RoundCornerContainer(
    {required Color containerColor, required String containerTest}) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        color: containerColor,
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
      child: Column(
        children: [
          Text(
            containerTest,
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            containerTest,
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
