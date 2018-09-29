import 'package:flutter/material.dart';
import './landing.dart';

class ScorePage extends StatelessWidget {
  final int _score;
  final int _totalQuestion;

  ScorePage(this._score, this._totalQuestion);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.black45,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Score",
          style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0, fontStyle: FontStyle.italic),
          ),
          new Text(_score.toString() + "/" + _totalQuestion.toString(),
              style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0, fontStyle: FontStyle.italic),
          ),
          new IconButton(
              icon: new Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 50.0,
              onPressed: () =>Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new LandingPage()),(Route route) => route == null),
          )
        ],
      ),
    );
  }
}