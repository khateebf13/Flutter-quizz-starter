import 'package:flutter/material.dart';
import '../utils/question.dart';
import './quizz_page.dart';

class LandingPage extends StatelessWidget{

  Widget build(BuildContext context) {
    return new Material(
      color: Colors.red,
      child: new InkWell(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Quizz", style: new TextStyle(color: Colors.white,fontSize: 40.0, fontWeight: FontWeight.bold,)),
            new Text("Let's start !!")
          ],
        ),
      ),
    );
  }
}