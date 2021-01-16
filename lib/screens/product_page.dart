import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {

  static String routeName = "/product_page";

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    final provider = Provider.of<ShoeProvider>(context,listen: false);
    Shoe shoe = provider.selectedShoe;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(32)
                  ),
                  child: Text("Buy Now",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(75),
                bottomLeft:  Radius.circular(75)
              ),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(120)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_left),
                          onPressed: (){

                          },
                        ),
                        IconButton(
                          icon: provider.isShoeInWishlist(shoe)? Icon(Icons.favorite):Icon(Icons.favorite_border),
                          onPressed: (){
                            setState(() {
                              provider.addToWishList(shoe);
                            });
                          },
                        )
                      ],
                    ),
                    Hero(
                        tag: shoe.name,
                        child: Image.asset(
                          shoe.imageURL,
                          height: ScreenUtil().setHeight(414),
                          width: ScreenUtil().setWidth(414),)
                    ),
                    Row(),
                    SingleChildScrollView(
                      child: Column(
                        children: [

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
