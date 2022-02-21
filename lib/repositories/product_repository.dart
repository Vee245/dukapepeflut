
import 'package:tired/models/product.dart';

class ProductsRepository{

  List<Product>  fetchAllProducts() {

    return [
      new Product("assets/images/Flour-2kg.jpg", "Jogoo Flour", 200, 250, 0,"Best Maize Flour in Kenya."),
      new Product("assets/images/dawaat.jpg", "Daawat Rice", 500, 500, 1,"Best Rice in Kenya."),
      new Product("assets/images/kcc.jpg", "KCC Milk", 50, 250, 2,"Best Milk in Kenya."),
      new Product("assets/images/kensalt.jpg", "Kensalt", 20, 250, 3,"Best Salt in Kenya."),
      new Product("assets/images/festive.png", "Festive Bread", 55, 400, 4,"Best Bread in Kenya."),
      new Product("assets/images/omo.jpg", "Omo", 300, 250, 5,"Best Washing Soap in Kenya"),
      new Product("assets/images/santamaria.jpg", "Santa Maria Spaghetti", 250, 250, 6,"Best Spaghetti in Kenya."),
    ];
  }
  
}