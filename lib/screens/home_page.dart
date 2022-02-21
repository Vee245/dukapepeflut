import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tired/bloc/cartbloc.dart';
import 'package:tired/components/cartmanager.dart';
import 'package:tired/components/gridshop.dart';
import 'package:tired/statemanagement/product_.dart';

import '../models/product_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showCart = false;
  CartBloc _cartBloc;
  List<Products> products = [];

  ScrollController _scrollController = new ScrollController();

  @override
  initState() {
    _scrollController = new ScrollController();
    _cartBloc = new CartBloc();
    getItems();
    print("HERE");
    super.initState();
  }

  Future getItems() async {
    var productsRepo =
        await Provider.of<ProductRepository>(context, listen: false)
            .getAllProducts();

    print("List of");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: <Widget>[
          CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(child: GridShop()),
                SliverToBoxAdapter(child: CartManager()),
              ]),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: FloatingActionButton(
                      onPressed: () {
                        if (_showCart)
                          _scrollController.animateTo(
                              _scrollController.position.minScrollExtent,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2));
                        else
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2));

                        setState(() {
                          _showCart = !_showCart;
                        });
                      },
                      backgroundColor: Colors.red,
                      child: new Icon(
                          _showCart ? Icons.close : Icons.shopping_cart))))
        ]));
  }

  @override
  void dispose() {
    _cartBloc.dispose();
    super.dispose();
  }
}
