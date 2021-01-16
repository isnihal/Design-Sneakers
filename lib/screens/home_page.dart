import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(32)
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: (){

                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.crop_square_rounded),
                  onPressed: (){

                  },
                )
              ],
            ),

            Row(
              children: [
                Text(
                  "Choose",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 26,
                    fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(8),),
                Text(
                  "Sneakers",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(64),
                      width: ScreenUtil().setWidth(64),
                      child: Center(
                        child: Icon(Icons.search),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,4),
                              blurRadius: 4
                          ),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,-6),
                              blurRadius: 4
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(64),
                      width: ScreenUtil().setWidth(64),
                      child: Center(
                        child: Icon(Icons.filter_alt_outlined),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,4),
                              blurRadius: 4
                          ),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,-6),
                              blurRadius: 4
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                  ],
                ),
                Container(
                  height: ScreenUtil().setHeight(64),
                  width: ScreenUtil().setWidth(148),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(16)
                  ),
                  child: Row(
                    children: [
                      Text("Cart",style: TextStyle(color: Colors.white),),
                      SizedBox(width: ScreenUtil().setWidth(16),),
                      Text("XX",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.red,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.yellow,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
