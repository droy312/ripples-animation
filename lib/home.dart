import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final String font = 'Varela_Round';
  final Color lightBlue = Color.fromRGBO(84, 201, 247, 1);

  double c1End = 100;
  int time = 700;

  bool isPressed = false;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  time = 0;
                  c1End = 100;
                  animationController.reset();
                });
              },
              duration: Duration(milliseconds: time),
              curve: Curves.fastOutSlowIn,
              tween: Tween<double>(begin: 100, end: c1End),
              builder: (context, size, child) {
                return FadeTransition(
                  opacity:
                      Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
                    curve: Curves.fastOutSlowIn,
                    parent: animationController,
                  )),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      border: Border.all(width: 6, color: lightBlue),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  time = 0;
                  c1End = 100;
                  animationController.reset();
                });
              },
              duration: Duration(milliseconds: time),
              curve: Curves.fastOutSlowIn,
              tween: Tween<double>(begin: 100, end: c1End),
              builder: (context, size, child) {
                return FadeTransition(
                  opacity:
                      Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
                    curve: Curves.fastOutSlowIn,
                    parent: animationController,
                  )),
                  child: Container(
                    width: size - 5,
                    height: size - 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlue,
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  time = 700;
                  c1End = 400;
                  animationController.forward();
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBlue,
                ),
                child: Text(
                  'Push',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: font,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
