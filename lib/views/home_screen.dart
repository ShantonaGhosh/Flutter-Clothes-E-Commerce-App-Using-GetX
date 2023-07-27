import 'package:clothes_ecommerce_app/widget/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/product_controller.dart';

import '../model/product_model.dart';
import '../widget/custom_cart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ProductController _productController = Get.put(ProductController());

  // List<Product> cartData = [];
  // RxList<Product> cartData = RxList<Product>();
  List<Product> cartData = <Product>[].obs;
  // var cartData = <Product>[].obs;
  //var totalPrice = 0.0.obs;
  var totalPrice = 0.obs;
  bool isHovered = false;

  //  changeQty() {
  //    totalNetPrice.value=0;
  //  for (var productItem in products) {
  //     if (productItem.itemQty != null)
  //      totalNet += ((double.parse(productItem.productPrice.toString()) *
  //          productItem.itemQty));
  //          },}

  addToCart(Product item) {
    cartData.add(item);
    print('add to cart');

    if (cartData.isNotEmpty) {
      totalPrice.value =
          cartData.fold(0, (sum, item) => sum + item.productPrice);
      print(totalPrice);
    }
  }

  addToFavorite(id)  {
    var index = _productController.productData
        .indexWhere((element) => element.id == id);

    _productController.productData[index].favorite =
        !_productController.productData[index].favorite;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[200],
        title: Text('Product List'),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                label: Obx(
                  () => Text('${cartData.length}'),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[200]!),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.fromLTRB(10, 15, 10, 30),
            child: Obx(
              () => _productController.productData.isEmpty
                  ? CustomProgressIndicator()
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      // padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                      itemCount: _productController.productData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 40.0,
                        crossAxisSpacing: 20.0,
                      ),
                      itemBuilder: (Build, index) {
                        var item = _productController.productData[index];
                        return CustomCart(
                          buttonTitle: 'Add to cart',
                          onTap: () {
                            addToCart(item);
                            print('--------add to cart');
                          },
                          productTitle: item.productName,
                          price: item.productPrice,
                          image: Image.asset(
                            '${item.productImage}',
                            height: 100,
                          ),
                          tkText: '৳-',
                          //          Icon(
                          //   rightIcon,
                          //   color: iconClr ?? Colors.green[200],
                          // ),
                          leftIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.save,
                              color: Colors.green[200],
                            ),
                          ),
                          rightIcon: IconButton(
                            onPressed: () {
                              addToFavorite(item.id);
                              print('add to favorite');
                            },
                            icon: Icon(
                              item.favorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 30,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50)),
                    color: Colors.green[200]),
                child: Text('Total Price : $totalPrice'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
