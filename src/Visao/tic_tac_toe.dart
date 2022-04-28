import 'package:flutter/material.dart';
import '../Modelo/game.dart';

class TicTacToe extends StatelessWidget{
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic-tac-toe",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(title: "Tic-tac-toe"),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  static const BorderSide defaultBorder = BorderSide(color: Colors.blueGrey, width: 2);

  void _playCell(int coordinate){
    setState(() {
      try {
        Game.insertValue(Game.playGame.cells[coordinate]);
        if(!Game.running && Game.winner == "")
          Game.winner = Game.turn + " wins the game!";
      } on Exception {}
    });
  }

  void _finishGame(){

  }

  void _reloadGame(){
    setState(() {
      Game.reset();
    });
  }

  List<TableRow> _buildGame(){
    List<TableRow> linhas = [];
    List<Widget> interior = [];

    for(int i = 1; i < 10; i++){
      interior.add(TextButton(onPressed: ()=> _playCell(i - 1), child: Text(Game.playGame.cells[i - 1].value, textAlign: TextAlign.center)));
      if(i % 3 == 0) {
        linhas.add(TableRow(children: interior));
        interior = [];
      }
    }
    return linhas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Turn: " + Game.turn,
              style: Theme.of(context).textTheme.headline4
            ),
            Table(
              border: const TableBorder(
                  top: defaultBorder,
                  bottom: defaultBorder,
                  left: defaultBorder,
                  right: defaultBorder,
                  verticalInside: defaultBorder,
                  horizontalInside: defaultBorder
              ),
              children: _buildGame()
            ),
            Text(
              Game.winner,
                style: Theme.of(context).textTheme.headline4
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reloadGame,
        tooltip: 'Reload',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}