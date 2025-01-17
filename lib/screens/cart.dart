import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/components/order_item.dart';
import 'package:lavender_natural_cosmetics/components/payment_method_card.dart';
import 'package:lavender_natural_cosmetics/components/payment_methods.dart';
import 'package:lavender_natural_cosmetics/components/payment_total.dart';
import 'package:lavender_natural_cosmetics/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedPaymentIndex = -1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 8,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Image.asset(
                "assets/images/lavender_logo.png",
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Seu carrinho está vazio",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Raleway",
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, index) {
                      final item = cart.items[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                        child: OrderItem(
                          productId: item["id"],
                          imageURI: item['image'],
                          itemTitle: item['title'],
                          itemPrice: "R\$ ${item['price']}",
                          quantity: item['quantity'],
                          onRemove: () => cart.removeItem(item['id']),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PaymentMethods(
                    onMethodSelected: (index) {
                      setState(() {
                        _selectedPaymentIndex = index;
                      });
                    },
                  ),
                ),
                if (_selectedPaymentIndex == 2)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PaymentMethodCard(),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PaymentTotal(
                    orderPrice: cart.totalPrice,
                    shippingPrice: 15.90,
                    onFinalize: () {
                      cart.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Obrigado pela compra!",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Raleway",
                                color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
