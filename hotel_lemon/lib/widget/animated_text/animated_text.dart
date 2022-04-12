import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<AnimatedTextExample> _examples;
  int _index = 0;
  // int _tapCount = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _examples = animatedTextExamples(onTap: () {
  //     print('Tap Event');
  //     setState(() {
  //       _tapCount++;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _examples[_index];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(),
        height: 50.0,
        width: 200,
        child: Center(
          key: ValueKey(animatedTextExample),
          child: animatedTextExample.child,
        ),
      ),
    );
  }
}

class AnimatedTextExample {
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.color,
    required this.child,
  });
}

// Colorize Text Style
const _colorizeTextStyle = TextStyle(
  fontSize: 30,
  fontFamily: 'Horizon',
);

// Colorize Colors
const _colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

List<AnimatedTextExample> animatedTextExamples({VoidCallback? onTap}) =>
    <AnimatedTextExample>[
      AnimatedTextExample(
        color: Colors.blueGrey[50],
        child: AnimatedTextKit(
          totalRepeatCount: 1000000000000000,
          animatedTexts: [
            ColorizeAnimatedText(
              'Hotel Lemon',
              textStyle: _colorizeTextStyle,
              colors: _colorizeColors,
            ),
            ColorizeAnimatedText(
              'Hotel Lemon',
              textStyle: _colorizeTextStyle,
              colors: _colorizeColors,
            ),
            ColorizeAnimatedText(
              'Hotel Lemon',
              textStyle: _colorizeTextStyle,
              colors: _colorizeColors,
            ),
          ],
        ),
      ),
    ];
