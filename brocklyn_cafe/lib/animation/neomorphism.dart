import 'package:flutter/material.dart';

class NeoMorphism extends StatefulWidget {
  const NeoMorphism({Key? key}) : super(key: key);

  @override
  State<NeoMorphism> createState() => _NeoMorphismState();
}

class _NeoMorphismState extends State<NeoMorphism> {
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey[300],
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
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          spreadRadius: 1,
                          blurRadius: 15,
                        ),
                      ]
                    : null),
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
