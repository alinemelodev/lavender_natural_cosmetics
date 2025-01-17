import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/components/counter_component.dart';
import 'package:lavender_natural_cosmetics/providers/cart_provider.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  final String imageURI;
  final String itemTitle;
  final String itemPrice;
  final String productId;
  final int quantity;
  final VoidCallback? onRemove;

  const OrderItem({
    super.key,
    required this.imageURI,
    required this.itemTitle,
    required this.itemPrice,
    required this.productId,
    required this.quantity,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(itemTitle),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (onRemove != null) {
          onRemove!();
        }
      },
      background: Container(
        color: const Color.fromRGBO(204, 51, 51, 1.0),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        elevation: 1,
        clipBehavior: Clip.hardEdge,
        color: AppColors.backgroundCardColor,
        child: Row(
          children: <Widget>[
            Image(
              width: 135,
              height: 135,
              image: AssetImage(imageURI),
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(73, 69, 79, 1.0),
                      ),
                    ),
                    Text(
                      itemPrice,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(73, 69, 79, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CounterComponent(
                productId: productId,
                initialQuantity: quantity,
                onQuantityChanged: (newQuantity) {
                  Provider.of<CartProvider>(context, listen: false)
                      .updateQuantity(productId, newQuantity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
