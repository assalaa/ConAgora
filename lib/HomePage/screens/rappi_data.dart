import 'package:meta/meta.dart' show required;

class RappiCategory {
  const RappiCategory({
    required this.name,
    required this.products,
  });
  final String name;
  final List<RappiProduct> products;
}

class RappiProduct {
  const RappiProduct({
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

const rappiCategories = [
  RappiCategory(
    name: 'Entrées',
    products: [
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png')
    ],
  ),
  RappiCategory(
    name: 'Salades',
    products: [
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png')
    ],
  ),
  RappiCategory(
    name: 'Boissons',
    products: [
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png')
    ],
  ),
  RappiCategory(
    name: 'Soupes',
    products: [
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png')
    ],
  ),
  RappiCategory(
    name: 'Deserts',
    products: [
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png'),
      RappiProduct(
          name: 'Nom du plat',
          description: 'description goes here',
          price: 20,
          image: 'assets/plat1png')
    ],
  ),
];
