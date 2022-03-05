import 'package:meta/meta.dart' show required;

class CategoryData {
  const CategoryData({
    required this.name,
    required this.products,
  });
  final String name;
  final List<ProductData> products;
}

class ProductData {
  const ProductData({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  final String name;
  final String description;
  final double price;
  final String image;
}

const myCategories = [
  CategoryData(
    name: 'Entrées',
    products: [
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg')
    ],
  ),
  CategoryData(
    name: 'Salades',
    products: [
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
     ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg')
    ],
  ),
 CategoryData(
    name: 'Boissons',
    products: [
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here,description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg')
    ],
  ),
  CategoryData(
    name: 'Soupes',
    products: [
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg')
    ],
  ),
  CategoryData(
    name: 'Deserts',
    products: [
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
      ProductData(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg'),
     ProductData(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/Hamburgers.jpg')
    ],
  ),
];
