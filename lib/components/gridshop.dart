import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tired/components/minimalcart.dart';
import 'package:tired/components/productwidget.dart';
import 'package:tired/models/product.dart';
import 'package:tired/repositories/product_repository.dart';

import '../models/product_model.dart';
import '../statemanagement/product_.dart';
import 'category_drop_menu.dart';

class GridShop extends StatefulWidget {
  @override
  _GridShop createState() => _GridShop();
}

class _GridShop extends State<GridShop> {
  List<Products> _products =[];
  @override
  void initState() {
    // TODO: implement initState
    
    getItems();
    super.initState();
  }

  void getItems() async {
   
        
            
    _products =
        await Provider.of<ProductRepository>(context, listen: false).products;

    print("List2 ${_products.length} ");
  }

  @override
  Widget build(BuildContext context) {
    double _gridSize =
        MediaQuery.of(context).size.height * 0.88; //88% of screen
    double childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 1.0);

    // getItems();
     var myproducts = Provider.of<ProductRepository>(context).products;
            

    print("_products on grid ${myproducts}");
    return Column(children: <Widget>[
      Container(
          height: _gridSize,
          decoration: BoxDecoration(
              color: const Color(0xFFeeeeee),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_gridSize / 10),
                  bottomRight: Radius.circular(_gridSize / 10))),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CategoryDropMenu(),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.filter_list),
                            label: Text(""))
                      ]),
                  Container(
                      height: _gridSize - 88,
                      margin: EdgeInsets.only(top: 0),
                      child: PhysicalModel(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(_gridSize / 10 - 10),
                              bottomRight:
                                  Radius.circular(_gridSize / 10 - 10)),
                          clipBehavior: Clip.antiAlias,
                          child: GridView.builder(
                              itemCount: myproducts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: childAspectRatio),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: index % 2 == 0 ? 20 : 0,
                                        right: index % 2 == 0 ? 5 : 0,
                                        left: index % 2 == 1 ? 5 : 0,
                                        bottom: index % 2 == 1 ? 20 : 0),
                                    child: ProductWidget(
                                        product: myproducts[index]));
                              })))
                ]))
          ])),
      MinimalCart(_gridSize)
    ]);
  }
}
