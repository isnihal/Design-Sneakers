import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {

  static String routeName = "/product_page";

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ShoeProvider>(context,listen: false);
    Shoe shoe = provider.selectedShoe;

    return Scaffold(
      body: Center(
        child: Hero(tag: shoe.name,child: Image.asset(provider.selectedShoe.imageURL)),
      )
    );
  }
}
