import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>/* with TickerProviderStateMixin*/ {
  final int timerMaxSeconds = 600;
  int currentSeconds = 0;
  Timer? countDownTimer;

  String get timerText => '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';


  startTimeout() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  void dispose() {
    countDownTimer?.cancel();
    super.dispose();
  }


/*  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        value = (value+1) % 100;
        // value = (value + 1) % 100;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }*/

/*  late AnimationController controller;

  String get timerString {
    var durationValue = controller.duration! * controller.value;
    return '${(durationValue.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );
    if (controller.isAnimating) {
      controller.stop();
    } else {
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquarePercentIndicator(
          width: 140,
          height: 140,
          // startAngle: StartAngle.bottomRight,
          reverse: true,
          borderRadius: 12,
          shadowWidth: 1.5,
          progressWidth: 4,
          shadowColor: Colors.grey,
          progressColor: Colors.green,
          progress: currentSeconds / 600,
          child: Center(
              child: Text(
                "$timerText ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              )),
        ),
      ),
    );

    /*return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 260,
                width: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    border: Border.all(width: 4, color: Colors.grey.shade400)),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CustomPaint(
                                  painter: CustomTimerPainter(
                                    animation: controller,
                                    backgroundColor: Colors.yellow,
                                    color: Colors.white,
                                  ))
                                ,
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      timerString,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });*/
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    var progress = animation.value;
    var path = Path();

    if (progress == 100) paint.color = Colors.green;
    canvas.drawRect(Offset.zero & size, /*math.pi * 1.5, progress * 6, false,*/ paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}