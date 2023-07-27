import 'package:get/get.dart';

class Product {
  late final int id;
  late final String productName;
  late final String productImage;
  late final String productDescription;
  late final int productPrice;
  late bool favorite;

  Product(
      {required this.id,
      required this.productName,
      required this.productImage,
      required this.productDescription,
      required this.productPrice,required this.favorite,});
}
