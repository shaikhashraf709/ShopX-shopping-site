import 'package:get/state_manager.dart';
import 'package:shopping_site/model/product.dart';
import 'package:shopping_site/services/remote_services.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList = products;
      }
    } finally {
      isLoading(false);
    }
  }
}