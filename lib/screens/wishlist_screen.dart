import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget{

  final Function _drawerFunction;

  WishListScreen(this._drawerFunction);

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<ShoeProvider>(context);
    List<Shoe> products = provider.wishlist;

    return SafeArea(
      child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(icon: Icon(Icons.menu),onPressed:_drawerFunction,),
                    ),
                    Container(
                      width: double.infinity,
                      child: Stack(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                            child: Align(
                              alignment: Alignment.center,
                              child:Text("Wishlist",style:TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28
                              ) ,),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 16,
                          childAspectRatio: 2/2.75
                      ),
                      itemBuilder: (ctx,index){
                        return CartItem(cardNum: index,shoe: products[index]);
                      },

                    )
                )
              ]
          )
      ),
    );
  }
}
