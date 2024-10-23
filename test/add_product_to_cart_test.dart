import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:othaim/constants.dart';
import 'package:othaim/models/product.dart';
import 'package:othaim/screens/widgets/product_item.dart';

void main() {
  testWidgets('Calculate total price in cart', (WidgetTester tester) async {
    final product = Product(
        id: 1,
        title: 'Product 1',
        price: 10,
        description: 'Product 1 description',
        category: 'Category 1',
        image: imagePlaceholder,
        rating: Rating(rate: 4, count: 10));

    await tester.pumpWidget(GetMaterialApp(
      home: ProductItem(
        product: product,
        press: () {},
      ),
    ));

    final Finder addToCart = find.byKey(Key('product_item_${product.id}'));
    await tester.tap(addToCart);
    await tester.pumpAndSettle();

    // Assuming you have an add to cart button on the item details screen
    final Finder addButton = find.byKey(Key('add_to_cart_${product.id}'));

    await tester.tap(addButton);
    await tester.pumpAndSettle();

    final Finder navigateToCart = find.byKey(const Key('navigate_to_cart'));
    await tester.tap(navigateToCart);
    await tester.pumpAndSettle();

    // Verify the product is added to the cart
    expect(find.byKey(Key('cart_item_${product.id}')), findsOneWidget);
  });
}
