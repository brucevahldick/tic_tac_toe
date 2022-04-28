import 'validator_abstract.dart';
import 'game.dart';

class ValidatorColumn implements AbstractValidator{
  @override
  bool verify(int head) {
    return Game.playGame.cells[head].equals(Game.playGame.cells[head + 3])
        && Game.playGame.cells[head].equals(Game.playGame.cells[head + 6]);
  }
}