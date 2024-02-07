import '../../../screens/home/common_widgets/product_model.dart';

class CartModel {
  final Product product;
  final int numOfItem;

  CartModel({required this.product, required this.numOfItem});
}

List<CartModel> demoCarts = [
  CartModel(
      product: Product("123", 'Men Jeans', '',
          'assets/images/ps4_console_blue_1.png', "5500", "2500", false),
      numOfItem: 2),
  CartModel(
      product: Product(
          "1232",
          'Aro Water Purifier',
          'Buy Best Water Purifier | Water Filter For Home',
          'assets/images/ps4_console_blue_1.png',
          "500",
          "450",
          false),
      numOfItem: 1),
  CartModel(
      product: Product(
          "1243",
          'Meet the new iPhone 15 Pro Max - Apple Official Site',
          'Buy iPhone 15',
          'assets/images/ps4_console_blue_1.png',
          "1500",
          "150",
          false),
      numOfItem: 1),
];
