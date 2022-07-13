import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_first_game/ui/home_page.dart';
import 'package:flutter_first_game/util/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      _goto(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
            ),
            RotationTransition(
              turns: _animation,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.png"),
              ),
            )
          ],
        ));
  }

  _goto(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Tic Tac Toe")),
            (Route<dynamic> route) => false);
  }
}