import 'package:design_sneakers/screens/home_page.dart';

import 'package:flutter/material.dart';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {

  static const routeName =  "/contact_screen";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamed(HomePage.routeName);
        return null;
      },
      child: Scaffold(
          body: Container(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ColumnSuper(
                      innerDistance: -80.0,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ShapeOfView(
                                elevation: 4,
                                width: double.infinity,
                                height: 320,
                                shape: DiagonalShape(
                                    position: DiagonalPosition.Bottom,
                                    direction: DiagonalDirection.Left,
                                    angle: DiagonalAngle.deg(angle: 10)
                                ),
                                child: Image.asset(
                                  "assets/images/mac.jpg", fit: BoxFit.fill,filterQuality: FilterQuality.low,
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              height: 150,
                              width: 150,
                              child: ShapeOfView(
                                shape: CircleShape(
                                ),
                                child: Image.asset("assets/images/nihal.jpg",),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16,top: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Text("Nihal Ismail",style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26
                                      ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Text("Made with Flutter",style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ],
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(12)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 16),
                                  child: Text(
                                      "Imagining your product like this?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28
                                      )
                                  ),
                                ),
                                ListTile(
                                  onTap: _sendEmail,
                                  leading: Icon(FontAwesomeIcons.at,color: Colors.black87,),
                                  title: Text("nihalismailk@gmail.com"),
                                ),
                                ListTile(
                                  onTap:_launchWhatsapp,
                                  leading: Icon(FontAwesomeIcons.whatsapp,color: Colors.green,),
                                  title: Text("+91 7907136126"),
                                ),
                                ListTile(
                                  onTap: _launchWebsite,
                                  leading: Icon(FontAwesomeIcons.globeAmericas,color: Colors.blue,),
                                  title: Text("www.nihalismail.com",style: TextStyle(color: Colors.black),),
                                )
                              ],
                            ),
                          ),
                        )
                    )
                  ]
              )
          )
      ),
    );
  }

  _sendEmail() async{
    const url = "mailto:<nihalismailk@gmail.com>?subject=<App Development Enquiry>&body=<Hi\n>";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWebsite() async {
    const url = 'http://www.nihalismail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWhatsapp() async {
    FlutterOpenWhatsapp.sendSingleMessage("+91 7907136126", "Hello, I'm interested in working with you.");
  }
}
