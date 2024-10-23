import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim/bindings/app_binding.dart';
import '../constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your Cart')),
        body: Obx(() {
          if (AppBindings.cartController.cartItems.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          } else {
            return Column(
              children: [
                _buildCartItems(),
                const Spacer(),
                _buildTotalPrice(context),
              ],
            );
          }
        }),
        bottomNavigationBar: _buildBottomBar(context));
  }

  _buildCartItems() {
    return Expanded(
      flex: 24,
      child: ListView.builder(
        itemCount: AppBindings.cartController.cartItems.length,
        itemBuilder: (context, index) {
          var item = AppBindings.cartController.cartItems[index];
          debugPrint("from your ui your id is ${item.product.id}");
          return SizedBox(
            key: Key('cart_item_${item.product.id.toString()}'),
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: item.product.image ?? imagePlaceholder,
                fit: BoxFit.contain,
                placeholder: (ctx, value) =>
                    Image.asset("assets/images/placeholder.png"),
              ),
              title: Text(
                item.product.title ?? "",
              ),
              subtitle: Text('\$${item.product.price} x ${item.quantity}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      if (item.quantity > 1) {
                        AppBindings.cartController.decreaseQuantity(item);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      AppBindings.cartController.increaseQuantity(item);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Remove item'),
                            content: const Text(
                                'Are you sure you want to remove this item from your cart?'),
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Remove'),
                                onPressed: () {
                                  AppBindings.cartController.removeItem(item);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildTotalPrice(context) {
    return Expanded(
      flex: 1,
      child: Text(
        'Total: \$${AppBindings.cartController.totalPrice.toInt()}',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.teal,
            ),
      ),
    );
  }

  _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                AppBindings.cartController.cartItems.isEmpty
                    ? Colors.grey[300]
                    : Theme.of(context).primaryColor),
          ),
          onPressed: () {
            AppBindings.cartController.confirmOrder();
          },
          child: const Text(
            'Place Order',
            style: primaryTextStyle,
          )),
    );
  }
}
