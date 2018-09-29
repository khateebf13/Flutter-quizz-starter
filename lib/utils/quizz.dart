import './question.dart';
class Quizz{
  List<Question> _questions;
  int _currentIndexOfquestion = -1;
  int _score = 0;

  Quizz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get question => _questions ;
  int get qLength => _questions.length ;
  int get qNo => _currentIndexOfquestion +1 ;
  int get score => _score ;

  Question get nextQuestion {
    _currentIndexOfquestion ++;
    if(_currentIndexOfquestion >= qLength) return null;
    return question[_currentIndexOfquestion] ;
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++ ;
  }
}