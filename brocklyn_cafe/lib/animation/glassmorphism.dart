import 'package:flutter/material.dart';

import 'glasss_morphi.dart';

class GlassMorphism extends StatelessWidget {
  GlassMorphism({Key? key}) : super(key: key);
  bool _isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _isTrue;
        },
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 800,
              child: Image.asset(
                "images/d.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Center(
                    child: Text(
                      'Welcome to\nAnjesh Desgin',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Build Widget Glassmorphism
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Glassmorphism(
                      blur: 15,
                      opacity: 0.2,
                      radius: 20,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              'Explore and Learn Flutter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Learn the best design here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16.0,
                              ),
                            ),
                            const Spacer(),
                            Glassmorphism(
                              blur: 20,
                              opacity: 0.1,
                              radius: 50.0,
                              child: TextButton(
                                onPressed: () {
                                  // handle push to HomeScreen
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  child: const Text(
                                    'Get started now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
