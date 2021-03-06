import 'package:flutter/material.dart';

import 'package:tired/bloc/cartbloc.dart';
import 'package:tired/components/constants.dart';
import 'package:tired/models/cart.dart';

import 'constants.dart';

class MinimalCart extends StatelessWidget {
  final double _gridSize;
  final List<Widget> _listWidget = List(); //changed from list()
  final CartBloc _cartBloc = CartBloc();
  static final ScrollController _scrollController = ScrollController();
  MinimalCart(this._gridSize);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: _cartBloc.currentCart,
        stream: _cartBloc.observableCart,
        builder: (context, AsyncSnapshot<Cart> snapshot) {
          _fillList(snapshot.data, context);
          var content = Container(
              margin: EdgeInsets.only(left: 10, right: 80),
              width: double.infinity,
              height: MediaQuery.of(context).size.height - _gridSize,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listWidget.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Align(
                        alignment: Alignment.centerLeft,
                        child: _listWidget[index]);
                  }));
          try {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          } catch (e) {
            //TODO fix
          }
          return content;
        });
  }

  void _fillList(Cart cart, BuildContext context) {
    _listWidget.add(Text("Cart",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)));
    _listWidget.addAll(cart.orders.map((order) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            child: Hero(
              tag: "tagHeroOrder${order.id}",
              child: ClipOval(
                  child: Container(
                      color: Colors.white,
                      child: Image.network( order.product.getImage),
                      // child: Image.network( BaseUrl + order.product.getImage.substring(21)),
                      height: (MediaQuery.of(context).size.height - _gridSize) *
                          0.6)),
            ),
            onTap: () {
              //TODO
            },
          ));
    }).toList());
  }
}
