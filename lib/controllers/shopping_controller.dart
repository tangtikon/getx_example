import 'package:get/get.dart';
import 'package:getx_example/models/product.dart';

class ShoppingController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      ProductModel(
        id: 1,
        productName: "productName1",
        productItem: "productItem1",
        productDescription: "productDescription1",
        price: 89,
      ),
      ProductModel(
        id: 2,
        productName: "productName2",
        productItem: "productItem2",
        productDescription: "productDescription2",
        price: 79,
      ),
      ProductModel(
        id: 3,
        productName: "productName3",
        productItem: "productItem3",
        productDescription: "productDescription3",
        price: 69,
      ),
    ];
    products.addAll(productResult);
  }
}
