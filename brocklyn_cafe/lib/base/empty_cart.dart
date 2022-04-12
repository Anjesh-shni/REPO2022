import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCartPage extends StatefulWidget {
  const EmptyCartPage({Key? key}) : super(key: key);

  @override
  _EmptyCartPageState createState() => _EmptyCartPageState();
}

class _EmptyCartPageState extends State<EmptyCartPage>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool isGreenCoffee = false;
  bool isTextReady = false;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        isGreenCoffee = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          isTextReady = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _coffeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     "Cart",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 22,
      //       color: Colors.white,
      //     ),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: ApClrs.mainClr,
      // ),
      // backgroundColor: const Color(0XFFF8DC9C),
      body: Stack(
        children: [
          // Visibility(
          //   visible: isGreenCoffee,
          //   child: BottomPart(text: '', onPressed: () {  },),
          // ),
          AnimatedContainer(
            height: isGreenCoffee ? (height / 1.45) : height,
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  // BoxShadow(
                  //   offset: Offset(3, 3),
                  //   blurRadius: 10,
                  //   spreadRadius: 2,
                  //   color: Colors.black26,
                  // ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isGreenCoffee ? 25.0 : 0.0),
                  bottomRight: Radius.circular(isGreenCoffee ? 25.0 : 0.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  // firstChild: Lottie.asset('assets/image/emptycart.json'),
                  child: Lottie.asset(
                    'images/emptycart.json',
                    controller: _coffeeController,
                    height: height / 2,
                    onLoaded: (composition) {
                      _coffeeController.duration = composition.duration;
                      _coffeeController.forward();
                    },
                  ),
                  // crossFadeState: isGreenCoffee
                  //     ? CrossFadeState.showFirst
                  //     : CrossFadeState.showSecond,
                  duration: const Duration(seconds: 2),
                ),
                // Center(
                //   child: AnimatedOpacity(
                //     opacity: isTextReady ? 1 : 0,
                //     duration: const Duration(seconds: 1),
                //     child: Text(
                //       "Your is Cart!!!",
                //       style: GoogleFonts.lobster(
                //           textStyle: const TextStyle(
                //         fontSize: 50.0,
                //         color: Color(0XFF674335),
                //         fontWeight: FontWeight.bold,
                //       )),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
