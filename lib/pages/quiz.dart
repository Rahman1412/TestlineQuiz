import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/pages/summary.dart';
import 'package:quizapp/providers/quiz_provider.dart';

class MyQuiz extends StatefulWidget {
  const MyQuiz({super.key});

  @override
  State<MyQuiz> createState() => _MyQuiz();
}

class _MyQuiz extends State<MyQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App',style: TextStyle(
          fontWeight: FontWeight.bold
        )),
        centerTitle: true
      ),
      body: ChangeNotifierProvider<QuizProvider>(
        create: (BuildContext context) => QuizProvider(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<QuizProvider>(builder: (context, QuizProvider, child) {
                if(QuizProvider.isLoading){
                  return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()
                  );
                }else if(QuizProvider.questions.length > 0 && !QuizProvider.isLoading){
                  return Text(
                    "Question ${QuizProvider.currentQuestionIndex + 1}/${QuizProvider.questions.length}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  );
                }else{
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      QuizProvider.error ?? "Something went wrong, Please try again!",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.red
                      )
                    ),
                  );
                }
              }),
              const SizedBox(height: 16),
              Consumer<QuizProvider>(builder: (context, QuizProvider, child) {
                return Text(
                  QuizProvider.currentQuestion?.description ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                );
              }),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(child: Consumer<QuizProvider>(
                  builder: (context, quizProvider, child) {
                    final options = quizProvider.currentQuestion?.options;
                    if (options == null) {
                      return SizedBox();
                    }
                    return Column(
                      children: List.generate(
                        options.length,
                        (index) {
                          final option = options[index];
                          return RadioListTile<String>(
                            value: option.description ?? "",
                            groupValue: quizProvider.currentQuestion?.selectedOption ?? "",
                            onChanged: (value) {
                              quizProvider.setValue(value);
                            },
                            title: Text(
                              option.description ?? "",
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Consumer<QuizProvider>(
                    builder: (context, QuizProvider, child) {
                      if( QuizProvider.currentQuestionIndex == 0){
                        return SizedBox();
                      }else{
                        return Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: QuizProvider.currentQuestionIndex > 0
                                ? QuizProvider.previousQuestion
                                : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("Back"),
                          )
                        );
                      }
                    }
                  ),
                  SizedBox(height: 10.0),
                  Consumer<QuizProvider>(
                      builder: (context,QuizProvider,child){
                        if(!QuizProvider.isLoading && QuizProvider.questions.length == 0){
                          return Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){
                                  QuizProvider.getData();
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Retry"),
                              )
                          );
                        }if(QuizProvider.questions.length == (QuizProvider.currentQuestionIndex+1)){
                           return SizedBox();
                        }else{
                          return Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: QuizProvider.currentQuestion?.selectedOption != null
                                    ? QuizProvider.nextQuestion
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Next"),
                              )
                          );
                        }
                      }
                  ),
                  SizedBox(height: 10.0),
                  Consumer<QuizProvider>(builder: (context,QuizProvider,child){
                    if(QuizProvider.questions.length == (QuizProvider.currentQuestionIndex +1)){
                      return Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SummaryPage(
                                      questions: QuizProvider.questions,
                                )
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("Submit"),
                        ),
                      );
                    }else{
                      return SizedBox();
                    }

                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
