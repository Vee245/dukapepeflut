import 'package:flutter/material.dart';
import 'package:tired/components/constants.dart';
import 'package:tired/models/product.dart';
import 'package:tired/screens/productview.dart';

import '../models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final Products product;

  ProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.2;
    double fontSize = (height / 24).round().toDouble();

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => new ProductView(product: this.product)));
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: new Hero(
                          tag: "tagHero${this.product.getAbsoluteUrl}",
                          child: new Image.network(this.product.getImage,
                          // child: new Image.network(BaseUrl+this.product.getImage.substring(21),
                              fit: BoxFit.cover, height: height * 0.20))),
                  Container(
                      height: height * 0.25,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("\Kshs${this.product.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                            Container(
                                margin: EdgeInsets.only(top: 20, bottom: 10),
                                child: new Text("${this.product.name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: fontSize * 0.65))),
                            Text("${this.product.description}g",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: fontSize * 0.48))
                          ]))
                ])));
  }
}
