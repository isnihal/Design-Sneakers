import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/widgets/shoe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    var provider = Provider.of<ShoeProvider>(context);
    List<Shoe> _shoes = provider.shoes;

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
                      child: MaterialButton(
                        color: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: (){},
                        child: Center(
                          child: Icon(Icons.search),
                        ),
                      ),

                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(16),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(64),
                      width: ScreenUtil().setWidth(64),
                      child: MaterialButton(
                        color: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: (){},
                        child: Center(
                          child: Icon(Icons.filter_alt_outlined),
                        ),
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
                  child: MaterialButton(
                    color: Colors.black,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: (){},
                    child: Center(
                      child: Row(
                        children: [
                          Text("Cart    XXX",style: TextStyle(color: Colors.white),)
                        ],
                      )
                    ),
                  ),

                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            Expanded(
              child: WaterfallFlow.builder(
                itemCount: _shoes.length,
                padding: EdgeInsets.zero,
                gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: ScreenUtil().setHeight(30),
                  crossAxisSpacing: ScreenUtil().setWidth(30),
                ),
                itemBuilder: (ctx,index){
                  if(index==1)
                    return ShoeWidget(shoe: _shoes[index], hasMargin: true);
                  else
                    return ShoeWidget(shoe: _shoes[index], hasMargin: false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
