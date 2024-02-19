import '../../../screens/home/common_widgets/product_model.dart';

class CartModel {
  final Product product;
  final int numOfItem;

  CartModel({required this.product, required this.numOfItem});
}

List<CartModel> demoCarts = [
  CartModel(
      product: Product(
          pID: 123,
          name: 'Men Jeans',
          description: '',
          thumbnail: 'assets/images/ps4_console_blue_1.png',
          mrp: 5500,
          ofrPrice: 2500),
      numOfItem: 2)
];
