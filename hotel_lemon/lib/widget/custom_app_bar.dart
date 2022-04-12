import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomAppBAr extends StatefulWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBAr({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _CustomAppBArState createState() => _CustomAppBArState(title: title);

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _CustomAppBArState extends State<CustomAppBAr> {
  final String title;
  bool _isElevated = true;

  _CustomAppBArState({required this.title});

  late List<AnimatedTextExample> _examples;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _examples = animatedTextExamples(onTap: () {
      print('Tap Event');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _examples[_index];
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green.shade300,
      shadowColor: Colors.black,
      elevation: 10,
      title: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 0, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          key: ValueKey(animatedTextExample),
          child: animatedTextExample.child,
        ),
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isElevated = !_isElevated;
                Navigator.pushNamed(context, "/cart");
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.only(right: 10),
              duration: Duration(milliseconds: 200),
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: _isElevated
                      ? [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                          BoxShadow(
                            color: Colors.green.shade700,
                            offset: Offset(-4, -4),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ]
                      : null),
              child: Center(
                child: Badge(
                  animationType: BadgeAnimationType.fade,
                  toAnimate: false,
                  badgeColor: Colors.red,
                  badgeContent: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
  fontSize: 25,
  fontFamily: 'Horizon',
);

// Colorize Colors
const _colorizeColors = [
  Color(0xff900C3F),
  Colors.orangeAccent,
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
