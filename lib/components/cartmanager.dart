import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tired/bloc/cartbloc.dart';
import 'package:tired/components/orderwidget.dart';
import 'package:tired/models/cart.dart';

import '../statemanagement/product_.dart';

class CartManager extends StatefulWidget {
  const CartManager({Key key}) : super(key: key);

  @override
  _CartManager createState() => _CartManager();
}

class _CartManager extends State<CartManager> {
  final CartBloc _cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    double _gridSize = MediaQuery.of(context).size.height * 0.88;

    return Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StreamBuilder(
                    initialData: _cartBloc.currentCart,
                    stream: _cartBloc.observableCart,
                    builder: (context, AsyncSnapshot<Cart> snapshot) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: _gridSize,
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 40),
                                    child: Text("Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: _gridSize * 0.60,
                                    child: ListView.builder(
                                        itemCount: snapshot.data.orders.length,
                                        itemBuilder: (context, index) {
                                          // print(
                                          //     "Price: ${snapshot.data.orders[index].product.price}");
                                          // print(
                                          //     "product: ${snapshot.data.orders[index].product.id}");
                                          // print(
                                          //     "quantity: ${snapshot.data.orders[index].quantity}");

                                          // for (int i = 0; i < 4; i++) {
                                          //   Map m = {
                                          //     "price": snapshot.data
                                          //         .orders[i].product.price,
                                          //     "product": snapshot.data
                                          //         .orders[i].product.id,
                                          //     "quantity": snapshot
                                          //         .data.orders[i].quantity
                                          //   };
                                          //   List l = [];
                                          //   l.add(m);
                                          //   print(l);
                                          // }

                                          return Dismissible(
                                            background: Container(
                                                color: Colors.transparent),
                                            key: Key(snapshot
                                                .data.orders[index].id
                                                .toString()),
                                            onDismissed: (_) {
                                              _cartBloc.removerOrderOfCart(snapshot
                                                      .data.orders[
                                                  index]); //snapshot.data.orders have added a ull check
                                            },
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: OrderWidget(
                                                    snapshot.data.orders[index],
                                                    _gridSize)),
                                          );
                                        })),
                                Container(
                                    height: _gridSize * 0.15,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Total",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                          Text(
                                              "\KSHS${snapshot.data.totalPrice().toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      40)), //have added null check on total prie
                                        ]))
                              ]));
                    })
              ]),
          StreamBuilder(
              initialData: _cartBloc.currentCart,
              stream: _cartBloc.observableCart,
              builder: (context, snapshot) {
                // for (int i = 0; i < 4; i++) {
                //   print("Price2: ${snapshot.data.orders[i].product.price}");
                //   print("product2: ${snapshot.data.orders[i].product.id}");
                //   print("quantity2: ${snapshot.data.orders[i].quantity}");
                // }

                return Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        padding:
                            EdgeInsets.only(left: 10, bottom: _gridSize * 0.02),
                        width: MediaQuery.of(context).size.width - 80,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)),
                                padding: EdgeInsets.all(20),
                                primary: Colors.red),
                            onPressed: () async {
                              if (_cartBloc.currentCart.isEmpty)
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text("Cart is empty")));
                              else {
                                for (int i = 0;
                                    i <= snapshot.data.orders.length;
                                    i++) {
                                  await Provider.of<ProductRepository>(context,
                                          listen: false)
                                      .order(
                                          "${snapshot.data.orders[i].product.price}",
                                          snapshot.data.orders[i].product.id,
                                          snapshot.data.orders[i].quantity)
                                      .catchError((e) {
                                    print(e);
                                  });
                                }

                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Product purchased Successfully!!")));
                              }
                            },
                            child: Text("Next",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))));
              })
        ]));
  }
}
