import 'package:meta/meta.dart' show required;

class ScrollableCategory {
  const ScrollableCategory({
    required this.name,
    required this.products,
  });
  final String name;
  final List<ScrollableProducts> products;
}

class ScrollableProducts {
  final String name;
  final String description;
  final double price;
  final String image;
  const ScrollableProducts({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

const scrollableCategories = [
  ScrollableCategory(name: "Entrés", products: [
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
  ]),
  ScrollableCategory(name: "Salades", products: [
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
  ]),
  ScrollableCategory(name: "Soupes", products: [
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
  ]),
  ScrollableCategory(name: "Boissons", products: [
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
    ScrollableProducts(
        name: 'Nom du plat',
        description: 'description goes here',
        price: 21,
        image: 'assets/plat1.png'),
  ]),
];
