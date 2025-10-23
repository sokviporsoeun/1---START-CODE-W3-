import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  late Question q1;
  late Question q2;
  late Quiz quiz;

  setUp(() {
    q1 = Question(title: "Capital of france?", choices: ["Paris", "London", "Rome"], goodChoice: "Paris", points: 10);
    q2 = Question(title: "2+2", choices: ["4", "2", "3"], goodChoice: "4", points: 50);
    quiz = Quiz(questions: [q1, q2]);
  });

  test("test 1: correct all answer = 100% earn 60points", () {
    quiz.addAnswer(Answer(question: q1, answerChoice: "Paris"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "4"));

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(100));
    expect(quiz.getEarnedPoints(), equals(60));
    expect(quiz.getTotalPoints(), equals(60));
  });

   test("test 2: wrong all answer = 0% earn 0 points", () {
    quiz.addAnswer(Answer(question: q1, answerChoice: "London"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "3"));

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(0));
    expect(quiz.getEarnedPoints(), equals(0));
    expect(quiz.getTotalPoints(), equals(60));

    test("test 3: one right (q1), one wrong (q2) = 17%", (){
      quiz.addAnswer(Answer(question: q1, answerChoice: "Paris"));
      quiz.addAnswer(Answer(question: q2, answerChoice: "3"));

      // SCore should be 17%
      expect(quiz.getScoreInPercentage(), equals(17));
      expect(quiz.getEarnedPoints(), equals(10));
      expect(quiz.getTotalPoints(), equals(60));
    });
  });
}