
import 'package:tired/models/order.dart';

class Cart{
List<Order> _orders = [];
 // List<Order> _orders;

  Cart(){
    _orders = new List();//incase of anything chandeg from list()
  }

  void addOrder(Order order){
    _orders.add(order);
  }

  void removeOrder(Order order){
    _orders.remove(order);
  }

  double totalPrice(){
    double total = 0;
    _orders.forEach((o){
      total += o.orderPrice;
    });

    return total;
  }

  List<Order> get orders => _orders;

  int get orderCount => _orders.length;

  bool get isEmpty => _orders.length == 0;

}