import 'package:brocklyn_cafe/models/category_model.dart';
import 'package:brocklyn_cafe/models/product_moel.dart';
import 'package:brocklyn_cafe/models/table_model.dart';
import 'package:brocklyn_cafe/routes/routes_helper.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category.dart';

class TablePage extends StatelessWidget {
  const TablePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "List of table",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          color: Colors.green.shade100,
          height: Dimen.screenHeight,
          child: GridView.builder(
              padding: EdgeInsets.only(
                left: 10,
                right: 5,
                top: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1),
              // controller: pageController,

              itemCount: Tabble.listTabble.length,
              itemBuilder: (BuildContext context, int index) {
                int initial = index + 1;
                return InkWell(
                  onTap: () {
                    Get.toNamed(RouteHelper.getPopularFood());
                    // Get.to(CategoryPage(
                    //   categories: Category.categories[index],
                    //   localproducts: LocalProduct.localproducts[index],
                    // ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    margin: EdgeInsets.only(bottom: 10, right: 10, left: 5),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? Colors.green.shade200
                          : Colors.green.shade200,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                        ),
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(-5, 0),
                        ),
                        BoxShadow(
                          color: Colors.green,
                          offset: Offset(5, 0),
                        ),
                      ],
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Table No: $initial",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
