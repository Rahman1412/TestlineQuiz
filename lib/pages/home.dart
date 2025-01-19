import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/pages/quiz.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App",style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Welcome to the Quiz!"),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyQuiz())
                    );
                  }, child: Text("Start Now")
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}