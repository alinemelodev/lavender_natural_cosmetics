import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/screens/product_detail.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';

class ProductItem extends StatelessWidget {
  final String itemId;
  final String itemTitle;
  final String itemPrice;
  final String imageURI;
  final String itemDescription;

  const ProductItem({
    super.key,
    required this.itemId,
    required this.itemTitle,
    required this.itemPrice,
    required this.imageURI,
    required this.itemDescription,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              itemId: itemId,
              imageURI: imageURI,
              itemTitle: itemTitle,
              itemPrice: itemPrice,
              itemDescription: itemDescription,
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: AppColors.backgroundCardColor,
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                      "R\$ $itemPrice",
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
            SizedBox(
              width: 135,
              height: 135,
              child: Image(
                image: AssetImage(imageURI),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
