import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/screens/profile_page.dart';
import 'package:design_sneakers/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class CartScreen extends StatelessWidget {

  static String routeName = "/cart_screen";

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var provider = Provider.of<ShoeProvider>(context);
    List<Shoe> _cart = provider.cart;


    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Stack(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                    child: Align(
                      alignment: Alignment.center,
                      child:Text("Your Cart",style:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                      ) ,),),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32
                          ),
                          child: WaterfallFlow.builder(
                            itemCount: _cart.length,
                            padding: EdgeInsets.symmetric(
                              vertical: 8
                            ),
                            scrollDirection: Axis.vertical,
                            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: ScreenUtil().setHeight(30),
                              crossAxisSpacing: ScreenUtil().setWidth(30),
                            ),
                            itemBuilder: (ctx,index){
                              return CartItem(shoe: _cart[index],cardNum: index,);
                            },
                          ),
                        )
                    ),
                    Container(
                      height: mediaQuery.size.height/4,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Shipping", style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )),
                                  Text("\$${provider.shippingFee.toStringAsFixed(2)}", style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Tax(15%)", style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )),
                                  Text("\$${provider.tax.toStringAsFixed(2)}", style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Total", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28
                                  )),
                                  Text("\$${provider.totalAmount.toStringAsFixed(2)}", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black),
                child: Center(
                  child: Text("Checkout", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  )),
                ),
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
