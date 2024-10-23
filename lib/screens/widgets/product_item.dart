import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../../constants.dart';
import 'product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ProductItem({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('product_item_${product.id}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            _buildTitle(),
            _buildPrice(),
          ],
        ),
      ),
    );
  }

  _buildImage() {
    return Expanded(
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
          child: CachedNetworkImage(
            imageUrl: product.image ?? imagePlaceholder,
            fit: BoxFit.contain,
            width: double.infinity,
            placeholder: (ctx, value) =>
                Image.asset('assets/images/placeholder.png'),
          )),
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        product.title ?? "",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text('\$${product.price}'),
    );
  }
}
