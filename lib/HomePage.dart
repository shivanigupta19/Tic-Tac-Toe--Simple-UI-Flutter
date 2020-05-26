
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

   AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
    }
    return circle;
  }
 
  delay(){
    Future.delayed(const Duration(milliseconds: 5000),(){
      setState(() {
        this.resetGame();
      });
    });
  }
 
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      // if any user Win update the message state
      setState(() {
        this.message = '${this.gameState[0]} wins';
        this.delay();
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins';
        this.delay();
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins';
        this.delay();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        this.delay();
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins';
        this.delay();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
        this.delay();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        this.delay();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
        this.delay();
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Game Draw';
        this.delay();
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         Expanded(
           child: GridView.builder(
             padding: EdgeInsets.all(10.0),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               childAspectRatio: 1.0,
               mainAxisSpacing: 10.0,
               crossAxisSpacing: 10.0
             ), 
             itemCount: this.gameState.length,
             itemBuilder: (context , i) => SizedBox(
               width: 100,
               height: 100,
               child: MaterialButton(
                 onPressed: (){
                   this.playGame(i);
                 },
                 child: Image(
                   image: this.getImage(this.gameState[i]),
                   ),
               ),
             ), 
             ),
           ),
           Container(
             padding: EdgeInsets.all(5.0),
             child: Text(
               this.message,
               style: TextStyle(
                 fontSize: 30.0,
                 fontWeight: FontWeight.bold
                 ),
             ),
             ),
             MaterialButton(
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(25.0),
               side: BorderSide(color: Colors.white)
               ),
               color: Colors.black,
               minWidth: 200,
               height: 50,
               child: Text(
                 "Reset Game",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
               ),
               ),
               onPressed: ()
               {
                   this.resetGame();
               },
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'LearnCodeOnline.in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic
                  ),

                ),
                ),

                 Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Project by Shivani Gupta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic
                  ),

                ),
                )
       ],
    ); 
  }
}