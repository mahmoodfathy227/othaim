import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:othaim/screens/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../bindings/app_binding.dart';
import '../constants.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Othaim E-Commerce')),
      body: Obx(() {
        if (AppBindings.productController.isLoading.value) {
          return Skeletonizer(
            containersColor: Colors.grey.shade300,
            child: Column(children: [
              _buildSearchBar(),
              _buildCategoryDropdown(),
              _buildPriceRangeSlider(),
              _buildProductGrid(true),
            ]),
          );
        } else {
          return Column(
            children: [
              _buildSearchBar(),
              _buildCategoryDropdown(),
              _buildPriceRangeSlider(),
              _buildProductGrid(false),
            ],
          );
        }
      }),
      floatingActionButton: _buildCartButton(),
    );
  }

  _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: AppBindings.productController.setSearchText,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.teal),
          labelText: 'Search Products',
          filled: true,
          fillColor: Colors.teal.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select Category',
          filled: true,
          fillColor: Colors.teal.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        hint: const Text('Select Category'),
        value: AppBindings.productController.selectedCategory.value.isEmpty
            ? null
            : AppBindings.productController.selectedCategory.value,
        onChanged: (value) {
          AppBindings.productController.setCategory(value!);
        },
        items: <String>[
          'All',
          'electronics',
          'jewelery',
          'men\'s clothing',
          'women\'s clothing'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  _buildPriceRangeSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RangeSlider(
        values: AppBindings.productController.priceRange.value,
        min: 0,
        max: 1000,
        divisions: 20,
        activeColor: Colors.teal,
        onChanged: (RangeValues values) {
          AppBindings.productController.setPriceRange(values);
        },
        labels: RangeLabels(
          '\$${AppBindings.productController.priceRange.value.start.round()}',
          '\$${AppBindings.productController.priceRange.value.end.round()}',
        ),
      ),
    );
  }

  _buildProductGrid(bool isSkeleton) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: isSkeleton
            ? 8
            : AppBindings.productController.filteredProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: ProductItem(
                product: isSkeleton
                    ? sampleProduct
                    : AppBindings.productController.filteredProducts[index],
                press: () {}),
          );
        },
      ),
    );
  }

  _buildCartButton() {
    return FloatingActionButton(
      backgroundColor: Colors.teal.shade100,
      elevation: 3,
      onPressed: () {
        Get.to(() => const CartScreen());
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
