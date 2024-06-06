class Product {
  String? productName, productDescription, owner;
  int? productId, categoryId, stock;
  double? price;
  bool? isAvailable;
  String? image;
  String? categoryName;
  Product();

  // Product(
  //     {required this.productId,
  //     required this.productName,
  //     required this.categoryId,
  //     required this.price,
  //     required this.isAvailable,
  //     this.image = '',
  //     this.owner = '',
  //     this.productDescription = '',
  //     required this.stock});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    owner = json['owner'];
    categoryId = json['categoryId'];
    stock = json['stock'];
    price = json['price'];
    isAvailable = json['isAvaliable'] == 1 ? true : false;
    categoryName = json['categoryName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productDescription': productDescription,
      'categoryName': categoryName,
      'owner': owner,
      'categoryId': categoryId,
      'stock': stock,
      'price': price,
      'isAvailable': isAvailable,
      'image': image,
    };
  }
}
