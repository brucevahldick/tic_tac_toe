import 'cell.dart';
import 'play_game.dart';
import 'validator_factory.dart';

class Game{
  static String turn = "X";
  static String winner = "";
  static bool running = true;
  static PlayGame playGame = PlayGame();

  static void switchTurn(){
    turn = turn == "X" ? "O" : "X";
  }

  static insertValue(Cell cell){
    if(running) {
      cell.isAvailable() ? cell.value = turn : throw Exception();
      finishGame();
      if (running)
        switchTurn();
    }
  }

  static finishGame(){
    List<String> validators = [ValidatorFactory.LINE, ValidatorFactory.COLUMN, ValidatorFactory.DIAGONAL, ValidatorFactory.MATCH];
    ValidatorFactory validatorFactory = ValidatorFactory();
    for(final i in validators){
      if(validatorFactory.validate(i))
        running = false;
    }
  }

  static reset(){
    winner = "";
    running = true;
    playGame = PlayGame();
  }
}