import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:othaim/screens/home_screen.dart';
import '../constants.dart';
import '../db/database.dart';
import '../models/cart_item.dart';

/// Manages the cart, including adding and removing items, calculating total price, and loading items from cache.
class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  final GetStorageService? storageService = GetStorageService();

  double get totalPrice => calculateTotalPrice();

  @override
  void onInit() {
    loadCachedProducts();
    super.onInit();
  }

  /// Calculates the total price of all items in the cart.
  double calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price! * item.quantity;
    }
    return total;
  }

  /// Confirms the order and clears the cart. This is called when the user places an order.
  void confirmOrder() async {
    if (cartItems.isEmpty) {
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        Get.snackbar('No Internet Connection',
            'Please check your internet connection to complete your order');
      } else {
        cartItems.clear();
        Get.snackbar(
            'Order Confirmed', 'Your order has been placed successfully');
        Get.off(HomeScreen());
      }
    }
  }

  /// Adds a new item to the cart or increases the quantity of an existing item if it already exists.
  void addItem(CartItem item) {
    // Check if the item already exists in the cart
    int index = cartItems
        .indexWhere((element) => element.product.id == item.product.id);

    if (index != -1) {
      // Item exists, update the quantity
      cartItems[index].quantity += item.quantity;
    } else {
      // Item doesn't exist, add to cart
      cartItems.add(item);
    }

    if (storageService != null) {
      storageService!.cacheCartItems(cartItems);
    }

    cartItems.refresh();
    print("added successfully");
    print("cart items ${cartItems}");
  }

  /// Increases the quantity of an existing item in the cart.
  void increaseQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh();
  }

  /// Decreases the quantity of an existing item in the cart. If the item is already at the minimum quantity (1), this method does nothing.
  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      cartItems.refresh();
    }
  }

  /// Removes an item from the cart.
  void removeItem(CartItem item) {
    cartItems.remove(item);
  }

  /// Loads the cached cart items from the storage service. This is useful when the app is launched and the cart items need to be restored.
  void loadCachedProducts() async {
    if (storageService != null) {
      var cachedCartItems = storageService!.getCachedCartItems();
      cartItems.value = cachedCartItems;
    }
  }
}
