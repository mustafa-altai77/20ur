class Category {
  final int id;
  final String image;
  final String name;
  Category({required this.id, required this.image, required this.name});
}

List<Category> categories = [
  Category(id: 1, image: "cake_icon.png", name: "Cup Cake"),
  Category(id: 2, image: "coffee_logo.png", name: "Coffee"),
  Category(id: 3, image: "tea-cup.png", name: "Hot Tea"),
  Category(id: 4, image: "ice-cream-cup.png", name: "Bakery"),
];

class Product {
  final int id;
  final String image;
  final String name;
  final int categoryId;
  final double price; // Change to categoryId
  Product(
      {required this.id,
      required this.image,
      required this.name,
      required this.categoryId,
      required this.price});
}

List<Product> products = [
  Product(
      id: 1, image: "cupcake1.png", name: "Coffee", categoryId: 1, price: 15),
  Product(
      id: 2, image: "cupcake2.png", name: "Latte", categoryId: 1, price: 17),
  Product(
      id: 3,
      image: "cupcake3.png",
      name: "Green Tea",
      categoryId: 1,
      price: 18),
  Product(
      id: 4,
      image: "cupcake4.png",
      name: "Croissant",
      categoryId: 1,
      price: 13),
  Product(
      id: 5, image: "coffee1.png", name: "Coffee", categoryId: 2, price: 20),
  Product(id: 6, image: "coffee2.png", name: "Latte", categoryId: 2, price: 21),
  Product(
      id: 7, image: "coffee3.png", name: "Green Tea", categoryId: 2, price: 22),
  Product(
      id: 8,
      image: "cofffee4.png",
      name: "Croissant",
      categoryId: 2,
      price: 22),
  Product(id: 9, image: "5.png", name: "Coffee", categoryId: 3, price: 20),
  Product(id: 10, image: "coffee.png", name: "Latte", categoryId: 3, price: 25),
  Product(id: 11, image: "4.png", name: "Green Tea", categoryId: 3, price: 26),
  Product(id: 12, image: "3.jpg", name: "Croissant", categoryId: 3, price: 28),
  Product(id: 9, image: "2.jpg", name: "Coffee", categoryId: 4, price: 30),
  Product(id: 10, image: "1.jpg", name: "Latte", categoryId: 4, price: 15),
  Product(id: 11, image: "4.png", name: "Green Tea", categoryId: 4, price: 14),
  Product(id: 12, image: "3.jpg", name: "Croissant", categoryId: 4, price: 14),
];
