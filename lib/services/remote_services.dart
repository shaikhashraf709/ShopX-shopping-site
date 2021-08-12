import 'package:http/http.dart' as http;
import 'package:shopping_site/model/product.dart';
class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(productFromJson(jsonString));
      return productFromJson(jsonString);
    } else {
      //show error message
      print("could not get data");
      return null;
    }
  }
}