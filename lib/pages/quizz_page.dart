import 'package:flutter/material.dart';
import 'package:flutter_app/UI/question_text.dart';
import 'package:flutter_app/utils/question.dart';
import 'package:flutter_app/utils/quizz.dart';

import '../UI/answer_button.dart';
import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';
class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quizz quizz = new Quizz([
    new Question("pizza is healthy ?", false),
    new Question("Fish is healthy ?", false),
    new Question("Flutter is smart ?", true),
  ]);
  String questionText;
  bool isCorrect;
  int questionNumber;
  bool overlayIsVisible = false;

  void initState () {
    super.initState();
    currentQuestion = quizz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quizz.qNo;

  }
   void handleAnswer(bool answer){
      isCorrect = (currentQuestion.answer == answer);
      quizz.answer(isCorrect);
      this.setState((){
        overlayIsVisible = true;
      });
   }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, ()=> handleAnswer(true)),
            new QuestionText(questionNumber,questionText),
            new AnswerButton(false, ()=> handleAnswer(false)),
          ],
        ),
        overlayIsVisible == true ? new CorrectWrongOverlay(
            isCorrect,
            () {
              if(quizz.qLength == questionNumber) {
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new ScorePage(quizz.score,quizz.qLength)),(Route route) => route == null);
                return;
              }
              currentQuestion = quizz.nextQuestion;
              this.setState((){
                overlayIsVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quizz.qNo;
              });
            }
        ): new Container(),
      ],
    );
  }

}