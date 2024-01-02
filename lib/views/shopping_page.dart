import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/cart_controller.dart';
import 'package:getx_example/models/product.dart';
import 'package:getx_example/views/counter_page.dart';

import '../controllers/shopping_controller.dart';
import 'cart_page.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
            },
            child: const Text(
              "Counter Page",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                init: ShoppingController(),
                initState: (_) {
                  print("initState");
                },
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].productName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(controller.products[index].productDescription),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$${controller.products[index].price}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                    ),
                                    onPressed: () {
                                      cartController.addItemToCart(
                                        ProductModel(
                                          id: controller.products[index].id,
                                          productName: controller.products[index].productName,
                                          productItem: controller.products[index].productItem,
                                          productDescription: controller.products[index].productDescription,
                                          price: controller.products[index].price,
                                        ),
                                      );
                                    },
                                    child: const Text("Add To Cart"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 30,
              child: SizedBox(
                height: 40,
                width: 30,
                child: Stack(
                  children: [
                    GetX<CartController>(
                      builder: (controller) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "${controller.cartItems.length}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
