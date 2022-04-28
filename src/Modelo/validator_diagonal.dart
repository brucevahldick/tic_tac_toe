import 'validator_abstract.dart';
import 'game.dart';

class ValidatorDiagonal implements AbstractValidator{
  @override
  bool verify(int head) {
    int pivot = head - 4;
    if(Game.playGame.cells[head - pivot].equals(Game.playGame.cells[head - (pivot * 2)])
        && Game.playGame.cells[head - pivot].equals(Game.playGame.cells[head]))
      return true;
    return false;
  }
}