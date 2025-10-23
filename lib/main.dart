import 'domain/quiz.dart';
import 'ui/quiz_console.dart';

void main() {

  final questions = [
    Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        points: 10),
    Question(
        title: "2 + 2 = ?", 
        choices: ["2", "4", "5"], 
        goodChoice: "4",
        points: 50),
  ];

  final quiz = Quiz(questions: questions);
  final console = QuizConsole(quiz: quiz);

  console.startQuiz();
}
