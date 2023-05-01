import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/providers/theme_provider.dart';
import 'package:state_management_provider/views/cart_page.dart';
import 'package:state_management_provider/views/home_page.dart';

import 'controllers/providers/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(
                    context,
                  ).themeModel.isDark ==
                  false)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: {
            '/': (context) => const HomePage(),
            'cart_page': (context) => const CartPage(),
          },
        );
      },
    ),
  );
}
