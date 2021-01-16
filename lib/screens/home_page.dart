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
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: (){

                  },
                ),
                IconButton(
                  icon: Icon(Icons.crop_square_rounded),
                  onPressed: (){

                  },
                )
              ],
            ),
            Row(
              children: [
                Text("Choose"),
                SizedBox(width: ScreenUtil().setWidth(16),),
                Text("Device")
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.black,
                  height: 20,
                  width: 20,
                ),
                Container(
                  color: Colors.black,
                  height: 20,
                  width: 20,
                ),
                Container(
                  color: Colors.black,
                  height: 20,
                  width: 60,
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
