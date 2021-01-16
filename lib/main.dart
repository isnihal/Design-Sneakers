import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/screens/cart_screen.dart';
import 'package:design_sneakers/screens/home_page.dart';
import 'package:design_sneakers/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ShoeProvider())
      ],
      child: MaterialApp(
        title: 'Design Sneakers',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.white,
            primaryColor: Colors.black,
            fontFamily: 'Montserrat'
        ),
        routes: {
          HomePage.routeName: (ctx)=>HomePage(),
          ProductPage.routeName: (ctx)=>ProductPage(),
          CartScreen.routeName: (ctx)=>CartScreen(),
        },
      ),
    );
  }
}
