import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../db/database.dart';
import '../models/product.dart';
import '../services/api_services.dart';

/// This controller is responsible for managing the products in the app.
/// It fetches the products from the api, and stores them in a list.
/// It also provides methods for filtering the products.
class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var filteredProducts = <Product>[].obs;
  int currentPage = 8;
  var searchText = ''.obs;
  var selectedCategory = 'All'.obs;
  var priceRange = Rx<RangeValues>(RangeValues(0, 1000));
  final GetStorageService storageService = GetStorageService();

  @override
  void onInit() {
    super.onInit();
    checkConnectivityAndFetchProducts();
  }

  /// Loads the products from the local cache, if the cache is empty it does nothing.
  /// This method is used when the app is started, and the user does not have internet connection.
  /// It loads the products from the cache, so the user can still see the products he had in his app before.
  void loadCachedProducts() async {
    var cachedProducts = storageService.getCachedProducts();
    if (cachedProducts.isNotEmpty) {
      products.value = cachedProducts;
      filteredProducts.value = cachedProducts;
    }
  }

  /// Clears the search text and resets the filtered products to the original products list.
  void clearSearch() {
    searchText.value = '';
    filteredProducts.value = products.value;
  }

  /// This method is used when the app is started, and the user has internet connection.
  /// It fetches the products from the api, and stores them in a list.
  /// It also stores the products in the local cache, so the user can still see the products he had in his app before, even if he has no internet connection the next time he opens the app.
  void fetchProducts() async {
    try {
      isLoading(true);
      var productList = await ApiService.fetchProducts();

      products.assignAll(productList);
      filteredProducts.assignAll(productList);
      // await DatabaseService.db.cacheProducts(products);
      storageService.cacheProducts(products);
    } finally {
      isLoading(false);
    }
  }

  /// checks the internet connection, if connected fetches the products from
  /// the api, otherwise loads the products from the cache.
  void checkConnectivityAndFetchProducts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection
      print('No internet connection. Loading data from cache...');

      Get.snackbar(
        'Offline Mode',
        'You are in offline mode. Data is loaded from cache.',
        snackPosition: SnackPosition.BOTTOM,
      );
      loadCachedProducts();
    } else {
      debugPrint("yes theris' intenet");
      // Internet connection available
      fetchProducts();
    }
  }

  /// This method is used to filter the products based on the user's search,
  /// category and price range. It takes the products list and the search text as
  /// parameters, and returns a list of products that match the search and
  /// category criteria. It also updates the filteredProducts list with the
  /// result of the search.
  void filterProducts() {
    var results = products.where((product) {
      return product.title!
              .toLowerCase()
              .contains(searchText.value.toLowerCase()) &&
          (selectedCategory.value == 'All' ||
              product.category == selectedCategory.value) &&
          (product.price! >= priceRange.value.start &&
              product.price! <= priceRange.value.end);
    }).toList();
    filteredProducts.value = results;
  }

  /// This method is used to set the price range of the filtered products.
  /// It takes two doubles as parameters, representing the start and end of the
  /// price range. It updates the filteredProducts list with the products that
  /// fall within the given price range.
  void setSearchText(String text) {
    searchText.value = text;
    filterProducts();
  }

  /// This method is used to set the text of the search field.
  /// It takes a string as parameter, representing the text that the user has
  /// entered in the search field. It updates the filteredProducts list with the
  /// products that match the search criteria.
  void setCategory(String category) {
    selectedCategory.value = category;
    filterProducts();
  }

  /// This method is used to set the price range of the filtered products.
  /// It takes two doubles as parameters, representing the start and end of the
  /// price range. It updates the filteredProducts list with the products that
  /// fall within the given price range.
  void setPriceRange(RangeValues range) {
    priceRange.value = range;
    filterProducts();
  }
}
