// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

class Products {
  Products({
    this.id,
    this.name,
    this.getAbsoluteUrl,
    this.description,
    this.price,
    this.getImage,
    this.getThumbnail,
    this.quantity,
  });

  int id;
  String name;
  String getAbsoluteUrl;
  String description;
  String price;
  String getImage;
  String getThumbnail;
  int quantity;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        getAbsoluteUrl: json["get_absolute_url"],
        description: json["description"],
        price: json["price"],
        getImage: json["get_image"],
        getThumbnail: json["get_thumbnail"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "get_absolute_url": getAbsoluteUrl,
        "description": description,
        "price": price,
        "get_image": getImage,
        "get_thumbnail": getThumbnail,
        "quantity": quantity,
      };
}
