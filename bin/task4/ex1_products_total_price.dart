//This Application for Products total price calculation
class Product {
  String name;
  double price;
  String barcode;

  Product({required this.name, required this.price, required this.barcode});
}

double calculateTotalPrice(List<Product> products) {
  double totalPrice = 0;
  for (var product in products) {
    totalPrice += product.price;
  }
  return totalPrice;
}

void main() {
  List<Product> productList = [
    Product(name: 'Apples', price: 60, barcode: '032'),
    Product(name: 'Orange', price: 10, barcode: '044'),
    Product(name: 'Tomato', price: 10, barcode: '054'),
    Product(name: 'Eggs', price: 5.5, barcode: '104'),
    Product(name: 'Bananas', price: 15, barcode: '008'),
    Product(name: 'Cheese', price: 24, barcode: '065'),
    Product(name: 'Carrot', price: 7.5, barcode: '016'),
  ];

  // Calculate the total price
  double totalPrice = calculateTotalPrice(productList);

  // Print the total price
  print(
      'The total price of all products is: ${totalPrice.toStringAsFixed(2)} EGP');
}
