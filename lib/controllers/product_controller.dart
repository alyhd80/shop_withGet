import 'package:get/state_manager.dart';
import 'package:shop/services/remote_services.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteServices.fetchProducts();

    if (products != null) {

      productList.value = products;
      isLoading.value=true;
    }
  }
}
