import 'package:get/get.dart';
import 'package:getx_example/models/product.dart';

class CartController extends GetxController {
  RxList<ProductModel> cartItems = <ProductModel>[].obs;
  // double get price => 0.0;
  double get totalPrice => cartItems.fold(0, (previousValue, element) => previousValue += element.price);
  // int get cartCount {
  //   cartCount += 1;
  // }
  void addItemToCart(ProductModel products) async {
    cartItems.add(products);
  }

  void deleteItemInCart(int index) {
    cartItems.removeAt(index);
  }
}
