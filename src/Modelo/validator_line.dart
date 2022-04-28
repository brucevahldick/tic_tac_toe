import 'validator_abstract.dart';
import 'game.dart';

class ValidatorLine implements AbstractValidator{
  @override
  bool verify(int head) {
    return Game.playGame.cells[head].equals(Game.playGame.cells[head + 1])
        && Game.playGame.cells[head].equals(Game.playGame.cells[head + 2]);
  }
}