import 'package:equatable/equatable.dart';
import 'package:hotel_lemon/model/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double netPayable(subtotal) {
    if (subtotal >= 50.0) {
      return 0.0;
    } else {
      return 0.0;
    }
  }

  double total(subtotal, netPayable) {
    return subtotal + netPayable(subtotal);
  }

  Map get qtyString => productQuantity(products);
  String get totolString => total(subtotal, netPayable).toStringAsFixed(2);

  String get subtotolString => subtotal.toStringAsFixed(2);
  String get netPayableString => netPayable(subtotal).toStringAsFixed(2);
}
