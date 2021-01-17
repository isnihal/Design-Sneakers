import 'package:design_sneakers/models/shoe.dart';
import 'package:design_sneakers/providers/shoes_provider.dart';
import 'package:design_sneakers/screens/cart_screen.dart';
import 'package:design_sneakers/widgets/shoe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomePage extends StatefulWidget {

  static String routeName = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    //Screen Util Init
    ScreenUtil.init(context, designSize: Size(414, 896), allowFontScaling: true);

    var _selectedBrands = [true,true,true,true];

    //Provider data
    var provider = Provider.of<ShoeProvider>(context);
    provider.setFilteredShoes(_selectedBrands);
    List<Shoe> _shoes = provider.filteredShoes;

    _showAlertDialog(BuildContext context) {

      // set up the button
      Widget okButton = FlatButton(
        child: Text("Done"),
        onPressed: () {
          setState(() {
            provider.setFilteredShoes(_selectedBrands);
          });
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        contentPadding: EdgeInsets.zero,
        title: Text("Select Brands",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600),),
        content: StatefulBuilder(
          builder: (context,setState){
            return  Container(
              height: ScreenUtil().setHeight(260),
              width: ScreenUtil().setWidth(120),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      title: Text("Adidas"),
                      value: _selectedBrands[0],
                      onChanged: (newValue) {
                        print(newValue);
                        setState(() {
                          _selectedBrands[0] = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: Text("Nike"),
                      value: _selectedBrands[1],
                      onChanged: (newValue) {
                        print(newValue);
                        setState(() {
                          _selectedBrands[1] = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: Text("New Balance"),
                      value: _selectedBrands[2],
                      onChanged: (newValue) {
                        print(newValue);
                        setState(() {
                          _selectedBrands[2] = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: Text("Skechers"),
                      value: _selectedBrands[3],
                      onChanged: (newValue) {
                        print(newValue);
                        setState(() {
                          _selectedBrands[3] = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }


    return SafeArea(
      child: Scaffold(
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
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.menu),
                    onPressed: (){

                    },
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(32),
              ),
              Row(
                children: [
                  Text(
                    "Choose",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.normal
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
                          onPressed: (){
                            _showAlertDialog(context);
                          },
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
                      onPressed: (){
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cart",style: TextStyle(color: Colors.white),),
                            Text("${provider.cart.length}",style: TextStyle(color: Colors.white),)
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
      ),
    );
  }
}
