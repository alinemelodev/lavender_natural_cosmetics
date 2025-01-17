import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/components/product_item.dart';
import 'package:lavender_natural_cosmetics/products.dart';
import 'package:lavender_natural_cosmetics/screens/product_detail.dart';

class Cosmetics extends StatelessWidget {
  const Cosmetics({super.key});

  final List items = cosmetics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Cosméticos",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 95, 122, 1.0)),
                  ),
                  Text(
                    "Inspirados na pureza e poder da natureza",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(118, 95, 122, 1.0)),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            itemId: items[index]["id"],
                            imageURI: items[index]["image"],
                            itemTitle: items[index]["name"],
                            itemPrice: items[index]["price"],
                            itemDescription: items[index]["description"],
                          ),
                        ),
                      );
                    },
                    child: ProductItem(
                        itemId: items[index]["id"],
                        imageURI: items[index]["image"],
                        itemTitle: items[index]["name"],
                        itemPrice: items[index]["price"],
                        itemDescription: items[index]["description"]),
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
