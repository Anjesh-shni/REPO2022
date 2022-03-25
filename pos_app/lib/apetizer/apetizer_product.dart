import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/apetizer/apetizer_controller.dart';
import 'package:pos_app/apetizer/apetizer_model.dart';
import 'apetizer_model.dart';

class ApetizerProduct extends StatelessWidget {
  const ApetizerProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: Productd.productd.length,
      itemBuilder: (BuildContext context, index) {
        return CardApetizer(index: index);
      },
    ));
  }
}

class CardApetizer extends StatelessWidget {
  final apetizerController = Get.put(ApetizerController());
  final int index;
  CardApetizer({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Card(
        color: Colors.teal.shade50,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Productd.productd[index].productName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("\$${Productd.productd[index].price}"),
                      Text(Productd.productd[index].description),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // apetizerController.addProduct(Productd.productd[index]);
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.teal, Colors.redAccent]),
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
