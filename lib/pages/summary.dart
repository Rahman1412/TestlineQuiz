import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/pages/SummaryTile.dart';

import '../models/Questions.dart';
import 'home.dart';

class SummaryPage extends StatefulWidget{
  final List<Questions> questions;
  const SummaryPage({Key? key, required this.questions}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SummaryPage();

}

class _SummaryPage extends State<SummaryPage>{

  @override
  Widget build(BuildContext context) {
    final totalQuestion = widget.questions.length;
    final total_attempt = widget.questions.where((data) => data.selectedOption != "");
    final total_correct = widget.questions.where((data) => data.isCorrect == true);
    final total_incorrect = widget.questions.where((data) => data.selectedOption != "" && data.isCorrect == false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Summary",style: TextStyle(
          fontWeight: FontWeight.bold
        )),
        centerTitle: true,
        automaticallyImplyLeading: false
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SummaryTile(title: "Total Question", number: totalQuestion, color: Colors.green),
              SummaryTile(title: "Total Unattempt", number: (totalQuestion - total_attempt.length), color: Colors.grey),
              SummaryTile(title: "Total Correct", number: total_correct.length, color: Colors.green),
              SummaryTile(title: "Total Incorrect", number: total_incorrect.length, color: Colors.red),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false,
                      );
                    },
                    child: Text("Home")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}