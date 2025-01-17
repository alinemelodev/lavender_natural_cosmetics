import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lavender_natural_cosmetics/providers/cart_provider.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';

class HighlightItem extends StatelessWidget {
  final String itemId;
  final String imageURI;
  final String itemTitle;
  final String itemPrice;
  final String itemDescription;

  const HighlightItem(
      {super.key,
      required this.itemId,
      required this.imageURI,
      required this.itemTitle,
      required this.itemPrice,
      required this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColors.backgroundCardColor,
      elevation: 2,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(imageURI),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(73, 69, 79, 1.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    itemDescription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "R\$ $itemPrice",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(73, 69, 79, 1.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(
                          // UniqueKey().toString(),
                          itemId,
                          itemTitle,
                          itemPrice,
                          imageURI,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Produto adicionado ao carrinho!",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        );
                      },
                      style: AppColors.buttonStyle,
                      child: const Text(
                        'Comprar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
