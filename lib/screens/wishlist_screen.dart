import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/screens/home_page.dart';
import 'package:design_sneakers/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget{

  final Function _drawerFunction;

  WishListScreen(this._drawerFunction);

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<ShoeProvider>(context);
    List<Shoe> products = provider.wishlist;

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamed(HomePage.routeName);
        return null;
      },
      child: SafeArea(
        child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(32)
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(Icons.menu,size: ScreenUtil().setWidth(32)),
                              onPressed: _drawerFunction
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text("Wishlist",style:TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28
                            ) ,),
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
                            return CartItem(cardNum: index,shoe: products[index],isWishList: true,);
                          },

                        )
                    )
                  ]
              ),
            )
        ),
      ),
    );
  }
}
