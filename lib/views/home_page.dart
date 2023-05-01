import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/providers/product_provider.dart';
import 'package:state_management_provider/controllers/providers/theme_provider.dart';
import 'package:state_management_provider/res/all_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(Icons.light_mode_outlined),
          ),
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('cart_page');
                  },
                  icon: const Icon(Icons.shopping_cart_sharp),
                ),
                Text("${Provider.of<ProductProvider>(context).totlQuantity}"),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: allProduct.length,
        itemBuilder: (context, i) => Card(
          elevation: 3,
          child: ListTile(
            isThreeLine: true,
            leading: Text("${allProduct[i].id}"),
            title: Text(allProduct[i].name),
            subtitle:
                Text("${allProduct[i].category}\nRS. ${allProduct[i].price}"),
            trailing: IconButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .addProduct(product: allProduct[i]);
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
