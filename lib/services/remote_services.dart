import 'package:http/http.dart' as http;
import 'package:shop/models/product_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(
       Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")
            );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {

      return null;
    }

  }
}
