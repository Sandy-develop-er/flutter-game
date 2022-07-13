import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import '../util/app_colors.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;
  double height = 4;
  double width = 300;
  double angle = 0;
  bool win = false;
  bool loss = false;
  bool isStarting = false;
  bool isFirstClicked = false;
  bool isSecondClicked = false;
  bool isThirdClicked = false;
  bool isFourthClicked = false;
  bool isFifthClicked = false;
  bool isSixthClicked = false;
  bool isSeventhClicked = false;
  bool isEighthClicked = false;
  bool isNinthClicked = false;
  bool isLastCross = false;
  bool isLastZero = false;
  bool showFirstCross = false;
  bool showFirstZero = false;
  bool showSecondCross = false;
  bool showSecondZero = false;
  bool showThirdCross = false;
  bool showThirdZero = false;
  bool showFourthCross = false;
  bool showFourthZero = false;
  bool showFifthCross = false;
  bool showFifthZero = false;
  bool showSixthCross = false;
  bool showSixthZero = false;
  bool showSeventhCross = false;
  bool showSeventhZero = false;
  bool showEighthCross = false;
  bool showEighthZero = false;
  bool showNinthCross = false;
  bool showNinthZero = false;

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.5,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 10.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 2.0,
  );

  AnimationController? animation;
  Animation<double>? _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation!);

    animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation?.forward();
      }
    });
    animation?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            InkWell(
                onTap: () {
                  clearAll();
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Center(
                      child: Text(
                    "Clear",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ))
          ],
        ),
        body: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(options: particles),
            child: getBody()),
      ),
    );
  }

  getBody() {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        right: BorderSide(color: AppColors.green, width: 10),
                        bottom: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isFirstClicked == false &&
                          showFirstZero == false &&
                          showFirstCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isFirstClicked = true;
                                if (isStarting == false) {
                                  showFirstZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showFirstCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showFirstZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showFirstZero == true && showFirstCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        right: BorderSide(color: AppColors.green, width: 10),
                        bottom: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isSecondClicked == false &&
                          showSecondZero == false &&
                          showSecondCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isSecondClicked = true;
                                if (isStarting == false) {
                                  showSecondZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showSecondCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showSecondZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showSecondZero == true && showSecondCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isThirdClicked == false &&
                          showThirdZero == false &&
                          showThirdCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isThirdClicked = true;
                                if (isStarting == false) {
                                  showThirdZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showThirdCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showThirdZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showThirdZero == true && showThirdCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        right: BorderSide(color: AppColors.green, width: 10),
                        bottom: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isFourthClicked == false &&
                          showFourthZero == false &&
                          showFourthCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isFourthClicked = true;
                                if (isStarting == false) {
                                  showFourthZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showFourthCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showFourthZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showFourthZero == true && showFourthCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        right: BorderSide(color: AppColors.green, width: 10),
                        bottom: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isFifthClicked == false &&
                          showFifthZero == false &&
                          showFifthCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isFifthClicked = true;
                                if (isStarting == false) {
                                  showFifthZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showFifthCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showFifthZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showFifthZero == true && showFifthCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isSixthClicked == false &&
                          showSixthZero == false &&
                          showSixthCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isSixthClicked = true;
                                if (isStarting == false) {
                                  showSixthZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showSixthCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showSixthZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showSixthZero == true && showSixthCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        right: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isSeventhClicked == false &&
                          showSeventhZero == false &&
                          showSeventhCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isSeventhClicked = true;
                                if (isStarting == false) {
                                  showSeventhZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showSeventhCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showSeventhZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showSeventhZero == true && showSeventhCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        right: BorderSide(color: AppColors.green, width: 10),
                      )),
                  child: isEighthClicked == false &&
                          showEighthZero == false &&
                          showEighthCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isEighthClicked = true;
                                if (isStarting == false) {
                                  showEighthZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showEighthCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showEighthZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showEighthZero == true && showEighthCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: isNinthClicked == false &&
                          showNinthZero == false &&
                          showNinthCross == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (win == false) {
                                isNinthClicked = true;
                                if (isStarting == false) {
                                  showNinthZero = true;
                                  isStarting = true;
                                  isLastZero = true;
                                } else if (isLastZero == true &&
                                    isLastCross == false) {
                                  showNinthCross = true;
                                  isLastCross = true;
                                  isLastZero = false;
                                } else {
                                  showNinthZero = true;
                                  isLastZero = true;
                                  isLastCross = false;
                                }
                              }
                              _getLine();
                            });
                          },
                          child: Container())
                      : showNinthZero == true && showNinthCross == false
                          ? const Icon(
                              Icons.circle_outlined,
                              color: AppColors.red,
                              size: 60,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.yellow,
                              size: 75,
                            ),
                ),
              ],
            ),
          ],
        ),
        Visibility(
            visible: loss == true ? true : win,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  loss == true ? "LOSS" : "WIN",
                  style: const TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
              ),
            )),
        Visibility(
            visible: loss == true ? true : win,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    clearAll();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Play-Again",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )),
        Visibility(
          visible: win,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: top, bottom: bottom, left: left, right: right),
              child: Transform.rotate(
                angle: angle,
                child: FadeTransition(
                  opacity: _fadeInFadeOut!,
                  child: Container(
                    width: width,
                    height: height,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  clearAll() {
    isStarting = false;
    isFirstClicked = false;
    isSecondClicked = false;
    isThirdClicked = false;
    isFourthClicked = false;
    isFifthClicked = false;
    isSixthClicked = false;
    isSeventhClicked = false;
    isEighthClicked = false;
    isNinthClicked = false;
    isLastCross = false;
    isLastZero = false;
    showFirstCross = false;
    showFirstZero = false;
    showSecondCross = false;
    showSecondZero = false;
    showThirdCross = false;
    showThirdZero = false;
    showFourthCross = false;
    showFourthZero = false;
    showFifthCross = false;
    showFifthZero = false;
    showSixthCross = false;
    showSixthZero = false;
    showSeventhCross = false;
    showSeventhZero = false;
    showEighthCross = false;
    showEighthZero = false;
    showNinthCross = false;
    showNinthZero = false;
    win = false;
    loss = false;
    left = 0;
    right = 0;
    top = 0;
    bottom = 0;
    height = 0;
    width = 0;
    angle = 0;
    setState(() {});
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.white,
            title: const Text(
              'Are you sure?',
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            content: const Text(
              'Do you want to exit this app.',
              style: TextStyle(color: AppColors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'No',
                  style: TextStyle(color: AppColors.red),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes', style: TextStyle(color: AppColors.bg)),
              ),
            ],
          ),
        )) ??
        false;
  }

  _getLine() {
    if (showFirstZero == true &&
        showSecondZero == true &&
        showThirdZero == true) {
      setState(() {
        win = true;
        bottom = 200;
        width = 300;
        height = 4;
      });
    } else if (showFourthZero == true &&
        showFifthZero == true &&
        showSixthZero == true) {
      setState(() {
        win = true;
        width = 300;
        height = 4;
      });
    } else if (showSeventhZero == true &&
        showEighthZero == true &&
        showNinthZero == true) {
      setState(() {
        win = true;
        top = 200;
        width = 300;
        height = 4;
      });
    } else if (showFirstZero == true &&
        showFourthZero == true &&
        showSeventhZero == true) {
      setState(() {
        win = true;
        right = 200;
        width = 4;
        height = 300;
      });
    } else if (showSecondZero == true &&
        showFifthZero == true &&
        showEighthZero == true) {
      setState(() {
        win = true;
        width = 4;
        height = 300;
      });
    } else if (showThirdZero == true &&
        showSixthZero == true &&
        showNinthZero == true) {
      setState(() {
        win = true;
        left = 200;
        width = 4;
        height = 300;
      });
    } else if (showFirstZero == true &&
        showFifthZero == true &&
        showNinthZero == true) {
      setState(() {
        win = true;
        width = 4;
        height = 300;
        angle = -math.pi / 4;
      });
    } else if (showThirdZero == true &&
        showFifthZero == true &&
        showSeventhZero == true) {
      setState(() {
        win = true;
        width = 4;
        height = 300;
        angle = math.pi / 4;
      });
    } else if (showFirstCross == true &&
        showSecondCross == true &&
        showThirdCross == true) {
      setState(() {
        win = true;
        bottom = 200;
        width = 300;
        height = 4;
      });
    } else if (showFourthCross == true &&
        showFifthCross == true &&
        showSixthCross == true) {
      setState(() {
        win = true;
        width = 300;
        height = 4;
      });
    } else if (showSeventhCross == true &&
        showEighthCross == true &&
        showNinthCross == true) {
      setState(() {
        win = true;
        top = 200;
        width = 300;
        height = 4;
      });
    } else if (showFirstCross == true &&
        showFourthCross == true &&
        showSeventhCross == true) {
      setState(() {
        win = true;
        right = 200;
        width = 4;
        height = 300;
      });
    } else if (showSecondCross == true &&
        showFifthCross == true &&
        showEighthCross == true) {
      setState(() {
        win = true;
        width = 4;
        height = 300;
      });
    } else if (showThirdCross == true &&
        showSixthCross == true &&
        showNinthCross == true) {
      setState(() {
        win = true;
        left = 200;
        width = 4;
        height = 300;
      });
    } else if (showFirstCross == true &&
        showFifthCross == true &&
        showNinthCross == true) {
      setState(() {
        win = true;
        width = 4;
        height = 300;
        angle = -math.pi / 4;
      });
    } else if (showThirdCross == true &&
        showFifthCross == true &&
        showSeventhCross == true) {
      setState(() {
        win = true;
        width = 4;
        height = 300;
        angle = math.pi / 4;
      });
    } else if (isFirstClicked == true &&
        isSecondClicked == true &&
        isThirdClicked == true &&
        isFourthClicked == true &&
        isFifthClicked == true &&
        isSixthClicked == true &&
        isSeventhClicked == true &&
        isEighthClicked == true &&
        isNinthClicked == true) {
      setState((){
        loss = true;
      });
    }
  }
}
