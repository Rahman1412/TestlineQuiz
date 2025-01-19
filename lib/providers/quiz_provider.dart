
import 'package:flutter/cupertino.dart';

import '../models/Questions.dart';
import '../models/Quiz.dart';
import '../services/apiService.dart';

class QuizProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  int currentQuestionIndex = 0;

  late List<Questions> questions = [];
  Questions? currentQuestion;
  bool isLoading = true;
  String? error;

  QuizProvider(){
    getData();
  }

  void nextQuestion() {
    currentQuestionIndex++;
    currentQuestion = questions[currentQuestionIndex];
    notifyListeners();
  }

  void previousQuestion() {
    currentQuestionIndex--;
    currentQuestion = questions[currentQuestionIndex];
    notifyListeners();
  }

  void setValue(String? value){
    currentQuestion?.selectedOption = value;
    if(value != null){
      var is_correct = currentQuestion?.options.indexWhere((data) => data.isCorrect == true && value == data.description);
      if(is_correct != -1){
        currentQuestion?.isCorrect = true;
      }else{
        currentQuestion?.isCorrect = false;
      }
    }
    questions[currentQuestionIndex] = currentQuestion!;
    notifyListeners();
  }

  Future<void> getData() async{
    try{
      final isNetwork = await _apiService.checkInternetConnection();
      if(!isNetwork){
        error = "Please check your internet connection!";
        isLoading = false;
        notifyListeners();
        return;
      }
      isLoading = true;
      notifyListeners();
      final response = await _apiService.fetchData();
      if(response.isNotEmpty){
        isLoading = false;
        final data = Quiz.fromJson(response);
        questions.addAll(data.questions);
        currentQuestion = questions[currentQuestionIndex];
      }else{
        error = "Data not found!";
      }
      notifyListeners();
    }catch(e){
      error = "Something went wrong, Please try again!";
      isLoading = false;
      notifyListeners();
    }
  }
}