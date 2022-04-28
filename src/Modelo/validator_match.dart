import 'validator_abstract.dart';
import 'game.dart';

class ValidatorMatch implements AbstractValidator{
  @override
  bool verify(int head) {
    for(final cell in Game.playGame.cells){
      if(cell.isAvailable())
        return false;
    }
    Game.winner = "It's a match!";
    return true;
  }
}