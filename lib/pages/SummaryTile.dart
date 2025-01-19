import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryTile extends StatelessWidget{
  String title;
  int number;
  Color color;

  SummaryTile({required this.title,required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),

        Text(
          number.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
        ),
      ],
    );
  }

}