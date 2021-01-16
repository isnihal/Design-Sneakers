import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/shoe.dart';

class ShoeWidget extends StatelessWidget {

  final Shoe shoe;

  ShoeWidget(this.shoe);

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(360),
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
                fit: StackFit.expand,
                children: [
                  shoe.discount!=0? Text("-10% Off"):SizedBox(),
                  Image.asset(shoe.imageURL),
                ],
              )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8),),
          Text(shoe.name,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w100,fontSize: 18),),
          SizedBox(height: ScreenUtil().setHeight(4),),
          Text("\$${shoe.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
        ],
      ),
    );
  }
}
