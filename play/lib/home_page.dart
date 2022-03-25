import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play/constant/dimension.dart';
import 'package:play/controller/theme_controller.dart';
import 'package:play/model/table-model.dart';
import 'package:play/pages/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text('Point of sale'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(
              Get.isDarkMode ? Icons.wb_sunny : Icons.wb_sunny_rounded,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            onPressed: () => {
              themeController.changeTheme(),
            },
          ),
          IconButton(
            icon: Icon(
              Get.isDarkMode
                  ? Icons.shopping_cart_outlined
                  : Icons.shopping_cart_outlined,
              color: Get.isDarkMode ? Colors.white : Colors.amber,
            ),
            onPressed: () => {
              themeController.changeTheme(),
            },
          ),
        ],
      ),
      body: Container(
        height: Dimen.screenHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
                  child: Text(
                    "List of table",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                color: Colors.blueGrey,
                margin: EdgeInsets.only(
                  bottom: 8,
                ),
                height: Dimen.screenHeight / 1.3,
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.2),
                    itemCount: 20,
                    itemBuilder: (c, i) {
                      int initial = i + 1;
                      return InkWell(
                        onTap: () {
                          Get.to(ProductPage());
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          margin:
                              EdgeInsets.only(bottom: 10, right: 10, left: 5),
                          // height: 130,
                          // width: 60,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(0, 5),
                              ),
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(-5, 0),
                              ),
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(5, 0),
                              ),
                            ],
                            borderRadius: BorderRadiusDirectional.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/t33.jpg"),
                            ),
                          ),
                          child: Text(
                            "No:${initial.toString()}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
