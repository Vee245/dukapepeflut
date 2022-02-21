import 'package:flutter/material.dart';
import 'package:tired/components/constants.dart';

import 'package:tired/models/order.dart';

import 'constants.dart';

class OrderWidget extends StatelessWidget {
  final Order _order;
  final double _gridSize;
  OrderWidget(this._order, this._gridSize);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipOval(
              child: Container(
                  color: Colors.white,
                  child: Image.network(this._order.product.getImage),
                  // child: Image.network(BaseUrl + this._order.product.getImage.substring(21)),
                  height:
                      (MediaQuery.of(context).size.height - _gridSize) * 0.5)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(this._order.quantity.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          Text("x",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Flexible(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(this._order.product.name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          Flexible(
              flex: 1,
              child: Text("\Kshs${this._order.orderPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)))
        ]);
  }
}
