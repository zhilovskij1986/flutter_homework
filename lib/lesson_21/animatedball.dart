import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnimatedBall(),
    );
  }
}

class AnimatedBall extends StatefulWidget {
  const AnimatedBall({super.key});

  @override
  State<AnimatedBall> createState() => _AnimatedBallState();
}

class _AnimatedBallState extends State<AnimatedBall>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Alignment> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation =
        Tween<Alignment>(
          begin: const Alignment(0.0, -0.8),
          end: const Alignment(0.0, 1.03),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.bounceOut,
            reverseCurve: Curves.easeInOut,
          ),
        );

    //_controller.repeat();
    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: 1));
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
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
      appBar: AppBar(
        title: Text('Animated Ball', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[300],
              child: Stack(
                children: [
                  AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double ballWidth = 60;
                    double ballHeight = 60;
                    double turnAngle = 0.0;
                
                    if(_controller.status == AnimationStatus.reverse){
                      double progress = (1.03 - _animation.value.y) / (1.03 - (-0.8));
                      turnAngle = progress * 2 * 3.14;
                    }
                
                    double y = _animation.value.y;
                    if (y > 0.9 &&
                        _controller.status == AnimationStatus.forward) {
                      ballHeight = 45;
                      ballWidth = 75;
                    }
                    return Stack(
                      children: [
                        SkyBackground(controller: _controller),
                        Align(
                        alignment: _animation.value,
                        child: Transform.rotate(
                          angle: turnAngle,
                          child: Image.asset(
                            'assets/images/ball.png',
                            width: ballWidth,
                            height: ballHeight,
                          ),
                        ),
                      ),
                    ]
                    );
                  },
                ),
                ]
              ),
            ),
          ),
          Container(height: 100, color: Colors.green),
        ],
      ),
    );
  }
}

class SkyBackground extends StatelessWidget {
  final AnimationController controller;

  const SkyBackground({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 20,
          left: 20,
          child: Icon(Icons.wb_sunny, color: Colors.yellow, size: 100),
        ),
        const Positioned(
          top: 20,
          left: 200,
          child: Icon(Icons.cloud, color: Colors.white, size: 100),
        ),
        const Positioned(
          top: 60,
          left: 500,
          child: Icon(Icons.cloud, color: Colors.white, size: 100),
        ),
        Positioned(
          top: 100,
          left: 400 - (controller.value * 350),
          child: Transform.flip(
            flipX: controller.status != AnimationStatus.reverse,
            child: Image.asset(
              'assets/images/bird.gif',
              width: 70,
              height: 70,
            ),
          ),
        ),
      ],
    );
  }
}