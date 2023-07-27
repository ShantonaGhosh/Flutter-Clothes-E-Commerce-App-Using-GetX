import 'package:get/get.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  //List<Product> productData = [];
  RxList<Product> productData = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductData();
  }

  fetchProductData() async {
    // await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponse = [
      Product(
          id: 01,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt.png',
          productDescription: 'This product quality is good',
          productPrice: 799,
          favorite: false),
      Product(
          id: 02,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt1.png',
          productDescription: 'This product quality is good',
          productPrice: 699,
          favorite: false),
      Product(
          id: 03,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt2.png',
          productDescription: 'This product quality is good',
          productPrice: 599,
          favorite: false),
      Product(
          id: 04,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt3.png',
          productDescription: 'This product quality is good',
          productPrice: 799,
          favorite: false),
      Product(
          id: 05,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt4.png',
          productDescription: 'This product quality is good',
          productPrice: 499,
          favorite: false),
      Product(
          id: 06,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt5.png',
          productDescription: 'This product quality is good',
          productPrice: 799,
          favorite: false),
      Product(
          id: 07,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt6.png',
          productDescription: 'This product quality is good',
          productPrice: 799,
          favorite: false),
      Product(
          id: 08,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt7.png',
          productDescription: 'This product quality is good',
          productPrice: 699,
          favorite: false),
      Product(
          id: 09,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt8.png',
          productDescription: 'This product quality is good',
          productPrice: 599,
          favorite: false),
      Product(
          id: 10,
          productName: 'T-Shirt',
          productImage: 'assets/images/shirt9.png',
          productDescription: 'This product quality is good',
          productPrice: 799,
          favorite: false),
    ];

    productData.assignAll(serverResponse);
    update();
  }
}
