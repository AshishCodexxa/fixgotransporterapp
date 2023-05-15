import 'package:fixgotransporterapp/all_dialogs/bid_now_price_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/home_module/create_new_load_form_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';




class HomeChildScreen extends StatefulWidget {
  
  final HomeChildScreenListener mListener;
  
  const HomeChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<HomeChildScreen> createState() => _HomeChildScreenState();
}

class _HomeChildScreenState extends State<HomeChildScreen> {


  static const kGoogleApiKey = "AIzaSyDmKx2C1OIAxNzTeoxEH1U8getJT3hTQF4";

  String pickLocation = "";
  String dilveryLocation = "";

  int locationType = 0;
  int filterType = 0;


  @override
  void initState() {
    super.initState();
    filterType = 0;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:  Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: <Widget>[

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    getAdvContainer(SizeConfig.screenHeight, SizeConfig.screenWidth)
                  ],
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    getPickUpAndDeliverLocation(SizeConfig.screenHeight, SizeConfig.screenWidth),
                  ],
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    getFindingLoadFilter(SizeConfig.screenHeight, SizeConfig.screenWidth)
                  ],
                ),
              ),


              SliverPadding(
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.1),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 3,
                          (context, index) {
                        return  Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                            left: SizeConfig.screenWidth*0.0
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left: SizeConfig.screenWidth*0.02,
                                  right: SizeConfig.screenWidth*0.02,
                                top: SizeConfig.screenHeight*0.01
                              ),
                              child: Container(
                                decoration:  BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.07),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(2, 2)),
                                  ],
                                ),
                                child: ExpansionTile(
                                  title: Container(
                                    // height: SizeConfig.screenHeight*0.0,
                                    // decoration:  BoxDecoration(
                                    //   color: Colors.white,
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   boxShadow: <BoxShadow>[
                                    //     BoxShadow(
                                    //         color: Colors.black.withOpacity(0.1),
                                    //         blurRadius: 5,
                                    //         spreadRadius: 1,
                                    //         offset: const Offset(2, 6)),
                                    //   ],
                                    // ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02,
                                      top: SizeConfig.screenHeight*0.01),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Time Left  23:59:59 hrs.",
                                                  style: TextStyle(
                                                      color: CommonColor.TO_AREA_COLOR,
                                                      fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                                      fontFamily: "Roboto_Medium",
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Codexxa Business Solution Pvt. Ltd.",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                      fontFamily: "Roboto_Medium",
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,),
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    width: SizeConfig.screenWidth*0.5,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [

                                                        Text(
                                                          "City Avenue, Wakad",
                                                          style: TextStyle(
                                                              color: CommonColor.BLACK_COLOR,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                              fontFamily: "Roboto_Medium",
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                        ),

                                                        Text(
                                                          " - Pune Station",
                                                          style: TextStyle(
                                                              color: CommonColor.BLACK_COLOR,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                              fontFamily: "Roboto_Medium",
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.01,
                                                  top: SizeConfig.screenHeight*0.01),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                            text: '\u{20B9}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                  text: ' 2000/-',
                                                                  style: TextStyle(
                                                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.bold))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.001),
                                                        child: Row(
                                                          children: [
                                                            Text("(Transport Fare)",
                                                              style: TextStyle(
                                                                  color: Colors.black54,
                                                                  fontSize: SizeConfig.blockSizeHorizontal*2.0,
                                                                  height: SizeConfig.screenHeight*0.002
                                                              ),),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: SizeConfig.screenHeight*0.01,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                                          left: SizeConfig.screenWidth*0.03,
                                          right: SizeConfig.screenWidth*0.03,
                                      bottom: SizeConfig.screenHeight*0.02),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          // boxShadow: <BoxShadow>[
                                          //   BoxShadow(
                                          //       color: Colors.black.withOpacity(0.1),
                                          //       blurRadius: 5,
                                          //       spreadRadius: 1,
                                          //       offset: const Offset(2, 6)),
                                          // ],
                                        ),
                                        child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                ),
              ),


            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.02),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewLoadScreenForm()));
              },
              child: Container(
                height: SizeConfig.screenHeight*0.05,
                width: SizeConfig.screenWidth*0.33,
                decoration: BoxDecoration(
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                  child: Row(
                    children: [

                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: SizeConfig.screenHeight*0.035,
                            width: SizeConfig.screenWidth*0.07,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                          Icon(Icons.add)
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                        child: Text(
                          "New Load",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget getAdvContainer(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
          left: SizeConfig.screenWidth*0.03,
          right: SizeConfig.screenWidth*0.03),
      child: Container(
        height: SizeConfig.screenHeight*0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 6)),
          ],
        ),
        child: Image(image: AssetImage("assets/images/adv_demo.png"),
          fit: BoxFit.cover,),
      ),
    );
  }

  Widget getPickUpAndDeliverLocation(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03,
          right: parentWidth*0.03,
          top: parentHeight*0.02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(3, 3)),
          ],
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.02),
                      child: GestureDetector(
                        
                        onTap: (){
                          locationType = 1;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: parentWidth*0.71,
                          child: Text(pickLocation.isEmpty ? "Pick-up Location" : pickLocation,
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.015,
                          right: parentWidth*0.06),
                      child: GestureDetector(
                        onTap: (){
                          locationType = 1;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Icon(Icons.search,
                          color: Colors.black26,),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: parentHeight*0.02,
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black12,
                    child: Row(
                      children: const [
                        Text("hii",
                          style: TextStyle(
                              color: Colors.transparent
                          ),),
                      ],
                    ),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.015),
                      child: GestureDetector(
                        
                        onTap: (){
                          locationType = 2;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: parentWidth*0.71,
                          child: Text(dilveryLocation.isEmpty ? "Delivery Location" : dilveryLocation,
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.015,
                          right: parentWidth*0.06),
                      child: GestureDetector(
                        onTap: (){
                          locationType = 2;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Icon(Icons.search,
                            color: Colors.black26,),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: parentHeight*0.019,
                ),


              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.037,),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(bottom: parentHeight*0.016),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight*0.013,
                          width: parentWidth*0.026,
                          decoration: BoxDecoration(
                              color: CommonColor.FROM_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      GestureDetector(
                        
                        onTap: (){
                          if(mounted){
                            setState(() {

                              String loc = pickLocation;

                              pickLocation = dilveryLocation;
                              dilveryLocation = loc;
                            });
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                            child: Image(image: AssetImage("assets/images/add_reverse.png"),
                            height: parentHeight*0.017,)
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.013),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight*0.013,
                          width: parentWidth*0.026,
                          decoration: BoxDecoration(
                              color: CommonColor.TO_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getFindingLoadFilter(double parentHeight, double parentWidth){
    return  Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
          left: SizeConfig.screenWidth*0.03,
        right: parentWidth*0.03,),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Finding Load For",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal*4.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto_Medium'
                ),)
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
            child: Container(
              color: Colors.transparent,
              height: SizeConfig.screenHeight*0.07,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                  bottom: SizeConfig.screenHeight*0.01,
                ),
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01,
                      right: SizeConfig.screenWidth*0.04,),
                    child: GestureDetector(
                      onTap: (){
                        if(mounted){
                          setState(() {
                            filterType = 0;
                          });
                        }
                      },
                      child: Container(
                          height: SizeConfig.screenHeight*0.05,
                          width: SizeConfig.screenHeight*0.053,
                          decoration: BoxDecoration(
                            color: filterType != 0 ? Colors.white : CommonColor.SIGN_UP_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: const Offset(2, 4)),
                            ],
                          ),
                          child: Center(
                            child: Text("All",
                              style: TextStyle(
                                  color: filterType == 0 ? Colors.white : CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Medium'
                              ),),
                          )
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,
                      right: SizeConfig.screenWidth*0.04,),
                    child: GestureDetector(
                      
                      onTap: (){
                        if(mounted){
                          setState(() {
                            filterType = 1;
                          });
                        }
                      },
                      child: Container(
                          height: SizeConfig.screenHeight*0.05,
                          width: SizeConfig.screenHeight*0.14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: const Offset(2, 4)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01, right: SizeConfig.screenWidth*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Container(
                                  height: SizeConfig.screenHeight*0.03,
                                  width: SizeConfig.screenWidth*0.06,
                                  decoration: BoxDecoration(
                                      color: filterType != 1 ? CommonColor.UNSELECT_TYPE_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
                                      shape: BoxShape.circle
                                  ),
                                ),

                                Text("Open Body",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,
                      right: SizeConfig.screenWidth*0.04,),
                    child: GestureDetector(
                      onTap: (){
                        if(mounted){
                          setState(() {
                            filterType = 2;
                          });
                        }
                      },
                      child: Container(
                          height: SizeConfig.screenHeight*0.05,
                          width: SizeConfig.screenHeight*0.16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: const Offset(2, 4)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01, right: SizeConfig.screenWidth*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Container(
                                  height: SizeConfig.screenHeight*0.03,
                                  width: SizeConfig.screenWidth*0.06,
                                  decoration: BoxDecoration(
                                      color: filterType != 2 ? CommonColor.UNSELECT_TYPE_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
                                      shape: BoxShape.circle
                                  ),
                                ),

                                Text("Closed Body",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,
                      right: SizeConfig.screenWidth*0.04,),
                    child: GestureDetector(
                      
                      onTap: (){
                        if(mounted){
                          setState(() {
                            filterType = 3;
                          });
                        }
                      },
                      child: Container(
                          height: SizeConfig.screenHeight*0.05,
                          width: SizeConfig.screenHeight*0.11,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: const Offset(2, 4)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01, right: SizeConfig.screenWidth*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Container(
                                  height: SizeConfig.screenHeight*0.03,
                                  width: SizeConfig.screenWidth*0.06,
                                  decoration: BoxDecoration(
                                      color: filterType != 3 ? CommonColor.UNSELECT_TYPE_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
                                      shape: BoxShape.circle
                                  ),
                                ),

                                Text("Trailor",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),



        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.00),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: parentHeight*0.01,
                          width: parentWidth*0.021,
                          decoration: BoxDecoration(
                              color: CommonColor.FROM_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                          child: Container(
                            width: parentWidth*0.57,
                            color: Colors.transparent,
                            child: Text(
                              "City Avenue, Wakad",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: parentHeight*0.013,
                            width: parentWidth*0.003,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [

                        Container(
                          height: parentHeight*0.01,
                          width: parentWidth*0.021,
                          decoration: BoxDecoration(
                              color: CommonColor.TO_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Container(
                            width: parentWidth*0.6,
                            color: Colors.transparent,
                            child: Text(
                              "Pune Station",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: parentWidth*0.05,),
              //   child: Column(
              //     children: [
              //       RichText(
              //         text: TextSpan(
              //             text: '\u{20B9}',
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.w400,
              //               fontSize: SizeConfig.blockSizeHorizontal*3.7,
              //             ),
              //             children: [
              //               TextSpan(
              //                   text: ' 2000/-',
              //                   style: TextStyle(
              //                       fontSize: SizeConfig.blockSizeHorizontal*4.0,
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.bold))
              //             ]),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(top: parentHeight*0.001),
              //         child: Row(
              //           children: [
              //             Text("(Transport Fare)",
              //               style: TextStyle(
              //                   color: Colors.black54,
              //                   fontSize: SizeConfig.blockSizeHorizontal*2.0,
              //                   height: parentHeight*0.002
              //               ),),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),

         /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.007),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "(Post on 26th Jan 2023 | 10:30 am)",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Pick-up Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.007),
                      child: Row(
                        children: [
                          Text(
                            "28 Jan 2023",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Bid End Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.007),
                      child: Row(
                        children: [
                          Text(
                            "27 Jan 2023",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Bid End Date",
                          style: TextStyle(
                              color: Colors.transparent,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.007,
                          left: parentWidth*0.03),
                      child:GestureDetector(
                        onTap: (){
                          showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return const AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: Duration(seconds: 2),
                                  child: LoadMoreInfoDialog(isComeFrom: '1',));
                            },
                          );
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessTimelinePage()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            "More",
                            style: TextStyle(
                                color: CommonColor.SIGN_UP_TEXT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                fontFamily: "Roboto_Regular ",
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015,
                left: parentWidth*0.012),
            child: CustomPaint(painter: DrawDottedhorizontalline()),
          ),*/

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
                top: parentHeight*0.01),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [

                            Container(
                              height: parentHeight*0.02,
                              width: parentWidth*0.045,
                              decoration: BoxDecoration(
                                  color: CommonColor.UNSELECT_TYPE_COLOR,
                                  shape: BoxShape.circle
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.015),
                              child: Text(
                                "Pack Load",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),

                          ],
                        ),

                        Row(
                          children: [

                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                                  left: parentWidth*0.02),
                              child: Container(
                                height: SizeConfig.screenWidth*0.05,
                                width: parentWidth*0.003,
                                color: Colors.black12,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.015),
                              child: Text(
                                "10 Ton(s) ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.05,),
                      child: GestureDetector(
                        
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              elevation: 10,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext bc) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                  ),
                                  child: CompanyVerifyDialog(),
                                );
                              });
                        },
                        child: Container(
                          height: parentHeight*0.025,
                          width: parentWidth*0.16,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black26,)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: parentWidth*0.01,
                                right: parentWidth*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Codexxa",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto_Medium',
                                    fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                  ),)

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [

                              Container(
                                height: parentHeight*0.02,
                                width: parentWidth*0.045,
                                decoration: BoxDecoration(
                                    color: CommonColor.UNSELECT_TYPE_COLOR,
                                    shape: BoxShape.circle
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: parentWidth*0.015),
                                child: Text(
                                  "Trailor Required",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),

                            ],
                          ),

                          Row(
                            children: [

                              Padding(
                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                                    left: parentWidth*0.02),
                                child: Container(
                                  height: SizeConfig.screenWidth*0.05,
                                  width: parentWidth*0.003,
                                  color: Colors.black12,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: parentWidth*0.015),
                                child: Text(
                                  "1550 RLW(Kg)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          Container(
                            height: parentHeight*0.02,
                            width: parentWidth*0.045,
                            decoration: BoxDecoration(
                                color: CommonColor.UNSELECT_TYPE_COLOR,
                                shape: BoxShape.circle
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: parentWidth*0.015),
                            child: Container(
                              color: Colors.transparent,
                              width: parentWidth*0.75,
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No. of vehicle 4",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.00,
                                        left: parentWidth*0.03),
                                    child:GestureDetector(
                                      onTap: (){
                                        showCupertinoDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (context) {
                                            return const AnimatedOpacity(
                                                opacity: 1.0,
                                                duration: Duration(seconds: 2),
                                                child: LoadMoreInfoDialog(isComeFrom: '1',));
                                          },
                                        );
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessTimelinePage()));
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Text(
                                          "More",
                                          style: TextStyle(
                                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                              fontFamily: "Roboto_Regular ",
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    /*  Padding(
                        padding: EdgeInsets.only(right: parentWidth*0.05,),
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                elevation: 10,
                                isScrollControlled: true,
                                isDismissible: true,
                                builder: (BuildContext bc) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom,
                                    ),
                                    child: BidNowPriceDialog(isComeFrom: '1',),
                                  );
                                });
                          },
                          child: Container(
                            width: SizeConfig.screenWidth*0.18,
                            height: SizeConfig.screenHeight*0.035,
                            decoration: BoxDecoration(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Bid Now",
                                  style: TextStyle(
                                      color: CommonColor.WHITE_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),

                              ],
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.012,
                  right: parentWidth*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              elevation: 10,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext bc) {
                                return BidNowPriceDialog(isComeFrom: '1', mainPrice: 2000,);
                              });
                        },
                        child: Container(
                          width: SizeConfig.screenWidth*0.18,
                          height: SizeConfig.screenHeight*0.035,
                          decoration: BoxDecoration(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Bid Now",
                                style: TextStyle(
                                    color: CommonColor.WHITE_COLOR,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Medium'
                                ),),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }



  Future<void> _handlePressButton(int locType) async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      offset: 0,
      radius: 1000,
      types: [],
      strictbounds: false,
      components: [],
    );

    // displayPrediction(p);
    setState(
          () {

            print("${p?.description}");


            if(locType == 1){
              pickLocation = p?.description ?? "";
            }else{
              dilveryLocation = p?.description ?? "";
            }

      },
    );

  }


}


abstract class HomeChildScreenListener{
  
}