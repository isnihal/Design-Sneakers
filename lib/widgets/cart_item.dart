import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/models/shoe.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class CartItem extends StatelessWidget {

  //Constructor
  final Shoe shoe;
  final int cardNum;
  final bool isWishList;

  CartItem({@required this.shoe,@required this.cardNum,@required this.isWishList});

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider
    final provider = Provider.of<ShoeProvider>(context,listen: false);

    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(300),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setHeight(16),
                    vertical: ScreenUtil().setWidth(16)
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Colors.grey[100],Colors.grey[300]],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  ),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.expand,
                  children: [
                    Hero(tag: shoe.name,child: Image.asset(shoe.imageURL)),
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Padding(
                        padding: EdgeInsets.zero,
                        child: Text(
                          "0${cardNum+1}",
                          style: TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoe.name,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.normal,fontSize: 18),),
                  SizedBox(height: ScreenUtil().setHeight(4),),
                  Text("\$${shoe.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    if(!isWishList) provider.removeFromCart(shoe);
                    else provider.removeFromWishList(shoe);
                  },
                  icon: Icon(Icons.delete,color: Colors.black,),
                ),
              )
             ],
          )
         ],
      ),
    );
  }
}
