import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
static const List<(Color?, Color? background, Text?,Icon?)> 
button = <(Color?, Color?, Text?,Icon?)>[
(Colors.white,Colors.green,Text("Vous avez validé votre compétence"),Icon(Icons.check)),
(Colors.white,Colors.red,Text("Vous n'avez pas validé votre compétence"),Icon(Icons.close)),
];
int index = 0;

void _changedecision(){
  setState(() {
    index = (index+1)%2;
  });
}

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title : Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          titleTextStyle: TextStyle(
            fontSize: 30.0,
            fontFamily: GoogleFonts.pacifico().fontFamily
          ) ,
          centerTitle: true,
        ),
        body: Center(
          child: button[index].$3,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changedecision,
          foregroundColor: button[index].$1,
          backgroundColor: button[index].$2,
          child: button[index].$4,),
      ),
    );
  }
}