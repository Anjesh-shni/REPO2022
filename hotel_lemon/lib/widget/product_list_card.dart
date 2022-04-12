import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_lemon/bloc/cartbloc/cart_bloc.dart';
import 'package:hotel_lemon/bloc/cartbloc/cart_event.dart';
import 'package:hotel_lemon/bloc/cartbloc/cart_state.dart';
import 'package:hotel_lemon/model/model_barrel.dart';

class ProduListCrad extends StatelessWidget {
  final Product products;

  const ProduListCrad({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${products.price.toString()}€",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CartLoaded) {
                    return Expanded(
                      child: IconButton(
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductRemoved(products));
                            final snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.amber,
                              content: Text(
                                "Product removed",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                          )),
                    );
                  } else {
                    return Text("Something Went Wrong");
                  }
                }),
                // Padding(
                //   padding: const EdgeInsets.only(top: 3),
                //   child: Text(
                //     "$quantity!",
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CartLoaded) {
                    return Expanded(
                      child: IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                                CartProductAdded(products),
                              );
                          final snackBar = SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.amber,
                            content: Text(
                              "Product Added",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return Text("Something Went Wrong");
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
