import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../controllers/product_controller.dart';

/// Manages the dependencies of the app.
class AppBindings extends Bindings {
  static CartController cartController = Get.put(CartController());
  static ProductController productController = Get.put(ProductController());

  @override
  void dependencies() {
    print("app binding started...");
  }
}
