import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:shop/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                    Expanded(
                        child: Text(
                      "shopX",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.grid_view)),
                  ],
                ),
              ),
              SizedBox(
                child: Obx(() => productController.isLoading.value
                    ? AlignedGridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: productController.productList.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed("/comoodity",
                                  arguments:
                                      productController.productList[index]);
                            },
                            child: ProductTile(
                                productController.productList[index]),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
