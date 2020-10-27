import 'package:flutter/material.dart';
import 'package:progress_bar/src/widgets/progress_bar.dart';

class HomePage extends StatelessWidget {
  static const route = "/home";

  final GlobalKey<ProgressBarCircularState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            child: ProgressBarCircular(key: _key,),  
          ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.refresh),
         onPressed: (){
           _key.currentState.changeProgressBar();
         },
         backgroundColor: Colors.lime,
         ),
    );
  }
}