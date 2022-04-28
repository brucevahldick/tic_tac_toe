class Cell{

  String _value = "_";

  String get value => _value;

  set value(String value) {
    _value = value;
  }

  bool isAvailable(){
    return _value == "_";
  }

  bool equals(Cell cell){
    if(cell.value != "_" && cell.value == _value)
      return true;

    return false;
  }
}