import 'package:design_sneakers/widgets/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Swiper(
                loop: false,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: 4,
                pagination: new SwiperPagination(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    top: 18,
                    left: 18
                  ),
                  builder: SwiperPagination.dots
                ),
                itemBuilder: (context, index) {
                  return IntroScreen(index);
                }
            )
        ),
      ),
    );
  }
}
