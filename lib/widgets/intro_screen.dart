import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {

  final int index;

  IntroScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return
      index == 0 ? Scaffold(
        backgroundColor: Colors.white,
      ) :
      index == 1 ? Scaffold(
        backgroundColor: Colors.white,
      ) :
      index == 2 ? Scaffold(
        backgroundColor: Colors.white,
      ) :
      index == 3 ? Scaffold(
        backgroundColor: Colors.white,
      ) : Scaffold();
  }
}
