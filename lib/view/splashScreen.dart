import 'dart:async';

import 'package:flutter/material.dart';

import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                    child: Image(image: AssetImage('images/sort1.png')),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: _controller.value * 3.0,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Sorting Visualiser',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
