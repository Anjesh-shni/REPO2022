import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'apetizer_controller.dart';
// import 'apetizer_model.dart';

class CartApe extends StatelessWidget {
  final ApetizerController apetizerController = Get.find();
  CartApe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller;
    return Expanded(
        child: ListView.builder(
      itemCount: controller.productd.length,
      itemBuilder: (BuildContext context, index) {
        return CardApeee(index: index);
      },
    ));
  }
}

class CardApeee extends StatelessWidget {
  final int index;
  CardApeee({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
