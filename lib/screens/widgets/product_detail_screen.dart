import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim/bindings/app_binding.dart';

import '../../../models/product.dart';
import '../../constants.dart';

import '../../models/cart_item.dart';
import '../cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? "")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProductImage(context),
              const SizedBox(
                height: 10,
              ),
              _buildProductTitle(context),
              const SizedBox(height: 8.0),
              _buildProductPrice(context),
              const SizedBox(height: 8.0),
              _buildProductDescription(context),
              const SizedBox(height: 16.0),
              _buildProductRating(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
      floatingActionButton: _buildAddToCartButton(context),
    );
  }

  _buildProductImage(context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: product.image ?? imagePlaceholder,
          fit: BoxFit.contain,
          placeholder: (ctx, value) =>
              Image.asset("assets/images/placeholder.png"),
        ));
  }

  _buildProductTitle(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        product.title ?? "",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w500),
        // style: primaryTextStyle.copyWith(
        //     fontWeight: FontWeight.w700, fontSize: 20),
      ),
    );
  }

  _buildProductPrice(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        '\$${product.price}',
        style: primaryTextStyle.copyWith(color: Colors.green, fontSize: 18),
      ),
    );
  }

  _buildProductRating(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellowAccent,
            size: 33,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '\$${product.rating?.rate ?? 0.0}/5.0 (${product.rating?.count ?? 0})',
            style: Theme.of(context).textTheme.bodyLarge,
            // style: primaryTextStyle.copyWith(
            //     color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }

  _buildProductDescription(BuildContext context) {
    return Text(
      product.description ?? "",
      style: primaryTextStyle,
    );
  }

  _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        key: Key('add_to_cart_${product.id}'),
        onPressed: () {
          // Add to cart functionality

          AppBindings.cartController
              .addItem(CartItem(product: product, quantity: 1));
          Get.snackbar('Success', '${product.title} added to cart!',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              borderRadius: 10,
              mainButton: TextButton(
                onPressed: () {
                  Get.to(() => const CartScreen());
                },
                child: Text(
                  'View Cart',
                  style: primaryTextStyle.copyWith(color: Colors.white),
                ),
              ),
              margin: const EdgeInsets.all(15),
              icon: const Icon(Icons.check),
              duration: const Duration(seconds: 2));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: primaryTextStyle,
        ),
        child: Text(
          'Add to Cart',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  _buildAddToCartButton(BuildContext context) {
    return FloatingActionButton(
      key: const Key('navigate_to_cart'),
      backgroundColor: Colors.teal.shade100,
      elevation: 3,
      onPressed: () {
        Get.to(() => CartScreen());
      },
      child: Obx(() {
        return Icon(
          Icons.shopping_cart,
          color: AppBindings.cartController.cartItems.isEmpty
              ? Colors.grey
              : Colors.white,
        );
      }),
    );
  }
}
