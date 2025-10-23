import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  final Game game;

  QuizConsole({required this.game});

  void start() {
    print('--- Welcome to the Multiplayer Quiz ---\n');

    while (true) {
      stdout.write('Enter player name (empty to quit): ');
      final name = stdin.readLineSync();
      if (name == null || name.isEmpty) {
        print('\nExiting. Last players scores:');
        _printAllScores();
        break;
      }

      print('\nStarting quiz for: $name\n');

      // collect answers for this player
      final answers = <Answer>[];
      for (var q in game.questions) {
        print('Question: ${q.title} (${q.points} points)');
        print('Choices: ${q.choices}');
        stdout.write('Your answer: ');
        final input = stdin.readLineSync() ?? '';
        answers.add(Answer(question: q, answerChoice: input));
        print('');
      }

      final submission = game.submitAnswers(name, answers);
      print('--- Quiz Finished for $name ---');
      print('Score: ${submission.percentage}%');
      print('Points: ${submission.earnedPoints}/${submission.totalPoints}\n');

      print('Last players:');
      _printAllScores();
      print('');
    }
  }

  void _printAllScores() {
    final subs = game.getAllSubmissions();
    if (subs.isEmpty) {
      print('  (no players yet)');
      return;
    }
    for (var s in subs) {
      print('  ${s.playerName}: ${s.percentage}% (${s.earnedPoints}/${s.totalPoints} points)');
    }
  }
}
 