import 'package:flutter/material.dart';
import 'package:take_home_test/models/shipping_information.dart';

import '../constants/enums/prod_location.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  void toggleIsFavorite(String id, ProdLocation prodLocation) async {
    Product product;
    if (prodLocation == ProdLocation.availableProducts) {
      product = _availableProducts.firstWhere((product) => product.id == id);
    } else {
      product = _recommendProducts.firstWhere((product) => product.id == id);
    }
    //
    // Product product =
    //     _availableProducts.firstWhere((product) => product.id == id);
    product.toggleFavorite();
    notifyListeners();
  }

  bool isItemOnFavorite(Product product) {
    return _availableProducts.any((product) => product.isFavorite == true);
  }

  List<Product> get availableProducts {
    return [..._availableProducts];
  }

  Product findById(String id) {
    return availableProducts.firstWhere((product) => product.id == id);
  }

  List<Product> get favItems {
    return _availableProducts.where((product) => product.isFavorite).toList();
  }

  List<Product> get recommendProducts => [..._recommendProducts];

  final List<Product> _recommendProducts = [
    Product(
      id: 'p9',
      name: 'Ultra Nike',
      imageUrl: 'assets/images/images-77.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 50.90,
      storeId: '2',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-77.jpeg',
        'assets/images/images-76.jpeg',
        'assets/images/images-75.jpeg',
        'assets/images/images-74.jpeg',
      ],
      colorName: 'Blue shade',
      brandName: 'Smart nike',
      catId: '4',
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 2.3,
    ),
    Product(
      id: 'p10',
      name: 'Nike Sleeve',
      imageUrl:
          'assets/images/s-new-women-shirt-pink-micus-original-imagmynzchgw2yjd.jpeg.webp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 70.90,
      storeId: '3',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/s-new-women-shirt-pink-micus-original-imagmynzchgw2yjd.jpeg.webp',
        'assets/images/images-80.jpeg',
        'assets/images/images-79.jpeg',
        'assets/images/images-78.jpeg',
      ],
      colorName: 'Black',
      brandName: 'Grey nike',
      catId: '3',
      soldNumber: 15,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 4.0,
    ),
  ];

  List<Product> storeProducts(String storeId) {
    return availableProducts
        .where((product) => product.storeId == storeId)
        .toList();
  }

  final List<Product> _availableProducts = [
    Product(
      id: 'p1',
      name: 'Nike Ups',
      imageUrl: 'assets/images/images-73.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 30.90,
      storeId: '1',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-73.jpeg',
        'assets/images/images-72.jpeg',
        'assets/images/images-71.jpeg',
        'assets/images/images-70.jpeg',
      ],
      colorName: 'Green',
      brandName: 'Leo nike',
      catId: '1',
      soldNumber: 20,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 4.3,
    ),
    Product(
      id: 'p2',
      name: 'Nike Top',
      imageUrl: 'assets/images/images-63.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 20.90,
      storeId: '2',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '300g',
      material: 'Fiber',
      otherImgs: [
        'assets/images/images-63.jpeg',
        'assets/images/images-64.jpeg',
        'assets/images/images-65.jpeg',
        'assets/images/images-66.jpeg',
      ],
      colorName: 'Red',
      brandName: 'Cat nike',
      catId: '3',
      soldNumber: 50,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 2.5,
      isFavorite: true,
    ),
    Product(
      id: 'p3',
      name: 'Sleek Nike',
      imageUrl: 'assets/images/images-62.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 60.90,
      storeId: '3',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '200g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-62.jpeg',
        'assets/images/images-61.jpeg',
        'assets/images/images-60.jpeg',
        'assets/images/images-59.jpeg',
      ],
      colorName: 'White',
      brandName: 'Leo nike',
      catId: '3',
      soldNumber: 50,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 5.0,
    ),
    Product(
      id: 'p4',
      name: 'Nike BackPack',
      imageUrl: 'assets/images/images-57.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 90.90,
      storeId: '1',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '100g',
      material: 'Silk',
      otherImgs: [
        'assets/images/images-57.jpeg',
        'assets/images/images-56.jpeg',
        'assets/images/images-55.jpeg',
      ],
      colorName: 'Blue',
      brandName: 'Leo nike',
      catId: '4',
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 3.3,
    ),
    Product(
      id: 'p5',
      name: 'Smooth Nike',
      imageUrl: 'assets/images/images-52.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 50.90,
      storeId: '2',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '120g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-53.jpeg',
        'assets/images/images-52.jpeg',
        'assets/images/images-51.jpeg',
        'assets/images/images-54.jpeg',
      ],
      colorName: 'White',
      brandName: 'Smart nike',
      catId: '4',
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 1.3,
    ),
    Product(
      id: 'p6',
      name: 'Nike Slider',
      imageUrl: 'assets/images/images-46.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 70.90,
      storeId: '2',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '300g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-47.jpeg',
        'assets/images/images-48.jpeg',
        'assets/images/images-49.jpeg',
      ],
      colorName: 'Green',
      brandName: 'Leo nike',
      catId: '1',
      soldNumber: 10,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 1.0,
    ),
    Product(
      id: 'p7',
      name: 'Neo Nike',
      imageUrl: 'assets/images/images-69.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 20.90,
      storeId: '3',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-68.jpeg',
        'assets/images/images-67.jpeg',
      ],
      colorName: 'White',
      brandName: 'Leo nike',
      catId: '3',
      soldNumber: 50,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 3.0,
    ),
    Product(
      id: 'p8',
      name: 'Leather BackPack',
      imageUrl: 'assets/images/images-33.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 40.90,
      storeId: '2',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-34.jpeg',
        'assets/images/images-35.jpeg',
      ],
      colorName: 'Black',
      brandName: 'Leo nike',
      catId: '4',
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 3.3,
    ),
    Product(
      id: 'p9',
      name: 'Ultra Nike',
      imageUrl: 'assets/images/images-40.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 50.90,
      storeId: '2',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-41.jpeg',
        'assets/images/images-42.jpeg',
        'assets/images/images-43.jpeg',
        'assets/images/images-44.jpeg',
      ],
      colorName: 'Blue shade',
      brandName: 'Smart nike',
      catId: '4',
      soldNumber: 120,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 2.3,
    ),
    Product(
      id: 'p10',
      name: 'Nike Sleeve',
      imageUrl: 'assets/images/images-52.jpeg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in velit ut quam convallis sollicitudin. Aliquam pretium velit euismod purus faucibus, in elementum libero pharetra. Curabitur auctor semper felis a suscipit.',
      descriptionList: [
        'Lorem ipsum dolor sit amet',
        'Curabitur auctor semper felis a suscipit',
        'Sed luctus quam vitae mauris imperdiet',
        'Proin quis ipsum eget turpis varius egestas',
        'Fusce tristique aliquam quam, ut convallis diam',
      ],
      price: 70.90,
      storeId: '3',
      reviews: ['1', '2', '3'],
      condition: 'New',
      heavy: '400g',
      material: 'Leather',
      otherImgs: [
        'assets/images/images-51.jpeg',
        'assets/images/images-53.jpeg',
        'assets/images/images-54.jpeg',
      ],
      colorName: 'Black',
      brandName: 'Grey nike',
      catId: '3',
      soldNumber: 15,
      shippingInformation: ShippingInformation(
        delivery: 'Shipping from Lorem ipsum dolor',
        shipping: 'FREE International Shipping',
        arrival: 'Estimated arrival on 25-27 Oct 2023',
      ),
      rating: 4.0,
    ),
  ];
}
