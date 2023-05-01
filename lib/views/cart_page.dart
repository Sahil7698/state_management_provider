import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/providers/product_provider.dart';

import '../controllers/providers/theme_provider.dart';
import '../models/product_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                    "Total Quantity: ${Provider.of<ProductProvider>(context).totlQuantity}"),
                Text(
                    "Total Price: ${Provider.of<ProductProvider>(context).totalPrice}"),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child: ListView.builder(
                itemCount:
                    Provider.of<ProductProvider>(context).addedProducts.length,
                itemBuilder: (context, i) {
                  List<ProductModel> data =
                      Provider.of<ProductProvider>(context).addedProducts;

                  return Card(
                    elevation: 3,
                    child: ListTile(
                      isThreeLine: true,
                      leading: Text("${i + 1}"),
                      title: Text(data[i].name),
                      subtitle:
                          Text("${data[i].category}\nRs. ${data[i].price}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart_outlined),
                        onPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .removeProduct(product: data[i]);
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
