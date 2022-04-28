import 'validator_column.dart';
import 'validator_diagonal.dart';
import 'validator_line.dart';
import 'validator_match.dart';

class ValidatorFactory{
  static const String LINE = "line";
  static const String COLUMN = "column";
  static const String DIAGONAL = "diagonal";
  static const String MATCH = "match";

  bool validate(String type){
    switch(type){
      case LINE:
        return _checkLines();
      case COLUMN:
        return _checkColumns();
      case DIAGONAL:
        return _checkDiagonals();
      case MATCH:
        return _checkMatch();
    }
    return false;
  }

  bool _checkLines(){
    List<int> lineHeads = [0, 3, 6];
    ValidatorLine validatorLine = ValidatorLine();
    for(final i in lineHeads){
      if(validatorLine.verify(i))
        return true;
    }
    return false;
  }

  bool _checkColumns(){
    List<int> columnHeads = [0, 1, 2];
    ValidatorColumn validatorColumn = ValidatorColumn();
    for(final i in columnHeads){
      if(validatorColumn.verify(i))
        return true;
    }
    return false;
  }

  bool _checkDiagonals(){
    List<int> diagonalHeads = [0, 1, 2];
    ValidatorDiagonal validatorDiagonal = ValidatorDiagonal();
    for(final i in diagonalHeads) {
      if(validatorDiagonal.verify(i))
        return true;
    }
    return false;
  }

  bool _checkMatch(){
    ValidatorMatch validatorMatch = ValidatorMatch();
    return validatorMatch.verify(0);
  }
}