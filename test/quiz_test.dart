import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {

  Question q1 =
      Question(title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", points: 10);
  Question q2 =
      Question(title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", points: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);

  setUp(() {});

  test("test 1", () {
    quiz.addAnswer(Answer(question: q1, answerChoice: "2"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "6"));

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(100));
    expect(quiz.getEarnedPoints(), equals(60));
    expect(quiz.getTotalPoints(), equals(60));
  });

   test("test 2", () {
    quiz.addAnswer(Answer(question: q1, answerChoice: "7"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "9"));

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(0));
    expect(quiz.getEarnedPoints(), equals(0));
    expect(quiz.getTotalPoints(), equals(2));
  });
}