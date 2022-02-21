
import 'package:tired/models/product.dart';

import 'product_model.dart';

class Order {

  Products _product;
  int _quantity;
  int _id;

  Order(this._product, this._quantity, this._id);

  int get id => _id;

  int get quantity => _quantity;

  Products get product => _product;

  double get orderPrice => _quantity*double.parse(_product.price)   ;

}