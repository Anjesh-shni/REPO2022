import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_lemon/bloc/cartbloc/cart_bloc.dart';
import 'package:hotel_lemon/bloc/cartbloc/cart_state.dart';
import 'package:hotel_lemon/screen/print/print.dart';
import 'package:hotel_lemon/widget/bottom_nav_bar.dart';
import 'package:hotel_lemon/widget/cart_productcard.dart';
import 'package:hotel_lemon/widget/custom_app_bar.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = "/checkout";

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: CustomAppBAr(title: "Checkout"),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SingleChildScrollView(
                          child: SizedBox(
                            height: 430,
                            child: ListView.builder(
                                itemCount: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) {
                              
                                  return CartProductCard(
                                    product: state.cart
                                        .productQuantity(state.cart.products)
                                        .keys
                                        .elementAt(index),
                                    quantity: state.cart
                                        .productQuantity(state.cart.products)
                                        .values
                                        .elementAt(index),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5)),
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text(
                                'Total :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${state.cart.totolString}€",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 8,
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(),
                              ),
                              child: Text('Print'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<CartState>(
                                      builder: (_) => Print(
                                     state: state.cart.products,
                                    total: state.cart.totolString,
                                    quantity: state.cart.qtyString,
                                        
                                          )),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("Somethimh went Wrong");
            }
          },
        ),
        bottomNavigationBar: CustomNavBar());
  }
}
