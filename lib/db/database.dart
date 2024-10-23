import 'package:get_storage/get_storage.dart';

import 'dart:convert';

import '../models/cart_item.dart';
import '../models/product.dart';

/// A service to cache products and cart items in the device's local storage
/// using the [GetStorage](https://pub.dev/packages/get_storage) package.
///
/// This class provides methods to cache products and cart items by converting
/// them to JSON strings and storing them in the local storage.
/// It also provides methods to retrieve the cached products and cart items
/// by converting the stored JSON strings back to objects.
class GetStorageService {
  final box = GetStorage();

  /// This method caches a list of products in the local storage as a list of JSON strings.
  /// The list of products is converted to a list of JSON strings using the
  /// [json.encode](https://api.dart.dev/stable/dart-convert/json-encode.html) method,
  /// and the list of strings is stored in the local storage using the
  /// [GetStorage.write](https://pub.dev/documentation/get_storage/latest/get_storage/GetStorage/write.html) method.
  void cacheProducts(List<Product> products) {
    List<String> productStrings =
        products.map((product) => json.encode(product.toJson())).toList();
    box.write('cachedProducts', productStrings);
  }

  /// This method caches a list of cart items in the local storage as a list of JSON strings.
  /// The list of cart items is converted to a list of JSON strings using the
  /// [json.encode](https://api.dart.dev/stable/dart-convert/json-encode.html) method,
  /// and the list of strings is stored in the local storage using the
  /// [GetStorage.write](https://pub.dev/documentation/get_storage/latest/get_storage/GetStorage/write.html) method.

  void cacheCartItems(List<CartItem> items) {
    List<String> itemsStrings =
        items.map((product) => json.encode(product.toJson())).toList();
    box.write('cachedCartItems', itemsStrings);
  }

  /// This method retrieves the cached products from the local storage and
  /// converts them from JSON strings back to a list of [Product] objects.
  /// The list of JSON strings is retrieved from the local storage using the
  /// [GetStorage.read](https://pub.dev/documentation/get_storage/latest/get_storage/GetStorage/read.html) method,
  /// and each JSON string is converted back to a [Product] object using the
  /// [json.decode](https://api.dart.dev/stable/dart-convert/json-decode.html) and
  /// [Product.fromJson](../models/product.dart#Product.fromJson) methods.
  List<Product> getCachedProducts() {
    List<dynamic>? productStrings = box.read<List<dynamic>>('cachedProducts');
    if (productStrings != null) {
      print("your coming list is ${productStrings}");
      return productStrings
          .map((productString) => Product.fromJson(json.decode(productString)))
          .toList();
    }
    return [];
  }

  /// This method retrieves the cached cart items from the local storage and
  /// converts them from JSON strings back to a list of [CartItem] objects.
  /// The list of JSON strings is retrieved from the local storage using the
  /// [GetStorage.read](https://pub.dev/documentation/get_storage/latest/get_storage/GetStorage/read.html) method,
  /// and each JSON string is converted back to a [CartItem] object using the
  /// [json.decode](https://api.dart.dev/stable/dart-convert/json-decode.html) and
  /// [CartItem.fromJson](../models/cart_item.dart#CartItem.fromJson) methods.
  List<CartItem> getCachedCartItems() {
    List<dynamic>? itemsStrings = box.read<List<dynamic>>('cachedCartItems');
    if (itemsStrings != null) {
      return itemsStrings
          .map((itemStrings) => CartItem.fromJson(json.decode(itemStrings)))
          .toList();
    }
    return [];
  }
}
