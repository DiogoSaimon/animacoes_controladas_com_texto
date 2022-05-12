import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animações Controladas com Textos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animações Controladas com Textos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 2);

  late AnimationController _controller;

  late Animation<Color?> _color;
  late Animation<double?> _sizeCircle;
  late Animation<double?> _sizeBorderInside;
  late Animation<double?> _sizeBorderInside1;
  late Animation<double?> _sizeBorderOutside;
  late Animation<double?> _sizeBorderOutside1;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);

    _color = ColorTween(
      begin: Colors.green[400],
      end: Colors.green[200],
    ).animate(_controller);

    _sizeCircle = Tween(
      begin: 100.0,
      end: 130.0,
    ).animate(_controller);

    _sizeBorderInside = Tween(
      begin: 190.0,
      end: 160.0,
    ).animate(_controller);

    _sizeBorderInside1 = Tween(
      begin: 194.0,
      end: 164.0,
    ).animate(_controller);

    _sizeBorderOutside = Tween(
      begin: 210.0,
      end: 240.0,
    ).animate(_controller);

    _sizeBorderOutside1 = Tween(
      begin: 211.0,
      end: 247.0,
    ).animate(_controller);

    _controller.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        width: _sizeBorderOutside1.value,
                        height: _sizeBorderOutside1.value,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: _sizeBorderOutside.value,
                        height: _sizeBorderOutside.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[100],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        width: _sizeBorderInside1.value,
                        height: _sizeBorderInside1.value,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: _sizeBorderInside.value,
                        height: _sizeBorderInside.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[100],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: _sizeCircle.value,
                  height: _sizeCircle.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _color.value,
                  ),
                );
              },
            ),
          ),
          Center(
            child: SizedBox(
              width: 150.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: Center(
                  child: AnimatedTextKit(
                    pause: _duration,
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText(
                        'INSPIRA',
                        duration: _duration,
                      ),
                      FadeAnimatedText(
                        'EXPIRA',
                        duration: _duration,
                      ),
                    ],
                    onTap: () {
                      print(
                          "Posso chamar outra tela, caso o usuário aperte na palavra");
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
