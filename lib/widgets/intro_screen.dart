import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {

  final int index;
  final SwiperController swiperController;

  IntroScreen({@required this.index,@required this.swiperController});

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    //Provider data
    var provider = Provider.of<ShoeProvider>(context,listen: false);

    return
      index == 0 ? Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(32)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(96),
              ),
              Row(
                children: [
                  Text("Design",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 28),),
                  SizedBox(width: ScreenUtil().setWidth(8),),
                  Text("Sneakers",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.normal,fontSize: 28),)
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(8),),
              Text("A curated list of collectible\nlimited edition sneakers",textAlign: TextAlign.start,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.normal,fontSize: 18),),
              SizedBox(height: 64,),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset("assets/images/adidas4.png"),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(90),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setWidth(60),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                    ),
                    onPressed: (){
                      swiperController.move(index+1);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ) :
      index == 1 ? Scaffold(
        backgroundColor: Colors.white,
      ) :
      index == 2 ? Scaffold(
        backgroundColor: Colors.white,
      ) :
      index == 3 ? Scaffold(
        backgroundColor: Colors.white,
      ) : Scaffold();
  }
}
