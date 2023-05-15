
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class VehicleOwnerInfoProfile extends StatefulWidget {
  const VehicleOwnerInfoProfile({Key? key}) : super(key: key);

  @override
  State<VehicleOwnerInfoProfile> createState() => _VehicleOwnerInfoProfileState();
}

class _VehicleOwnerInfoProfileState extends State<VehicleOwnerInfoProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Container(
            color: CommonColor.WHITE_COLOR,
            height: SizeConfig.safeUsedHeight * .88,
            child: /*ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
              children: [
                getTransporterProfile(SizeConfig.screenHeight, SizeConfig.screenWidth)
              ],
            )*/
            CustomScrollView(
              slivers: <Widget>[

                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      getTransporterProfile(SizeConfig.screenHeight, SizeConfig.screenWidth)
                    ],
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 5,
                            (context, index) {
                          return getAllVehicleList(SizeConfig.screenHeight, SizeConfig.screenWidth);
                        },
                      )
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTopText(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.05, left: parentWidth*0.035, right: parentWidth*0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new,
                color: CommonColor.WHITE_COLOR,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }


  Widget getTransporterProfile(double parentHeight, double parentWidth){
    return Container(
      color: CommonColor.PROFILE_INFO_BACK_COLOR,
      child: Column(
        children: [

            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  children: [
                    Container(
                      height: parentHeight*0.27,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: parentHeight*0.2,
                      color: CommonColor.UNSELECT_TYPE_COLOR,
                      child: Center(
                        child: Text("FixGo",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*6.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: CommonColor.BLACK_COLOR
                          ),),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.05),
                  child: Container(
                    height: parentHeight*0.12,
                    width: parentWidth*0.26,
                    decoration: BoxDecoration(
                      color: CommonColor.TRANSPORTER_PROFILE_COLOR,
                      shape: BoxShape.circle
                    ),
                  ),
                )
              ],
            ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
            right: parentWidth*0.05,
            top: parentHeight*0.03),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Mahesh Transporter",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w500,
                          color: CommonColor.BLACK_COLOR
                      ),),


                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.05),
                      child: Image(image: AssetImage("assets/images/adhar_tag.png")),
                    )

                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("Pune, Maharashtra",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400,
                            color: CommonColor.BLACK_COLOR
                        ),),


                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.01),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: parentWidth*0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Transporter",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontFamily: "Roboto_Regular",
                                  fontWeight: FontWeight.w400,
                                  color: CommonColor.BLACK_COLOR
                              ),),

                            Container(
                              height: parentHeight*0.03,
                              width: parentWidth*0.003,
                              color: Colors.black12,
                            ),

                            Text("99 Trips",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontFamily: "Roboto_Regular",
                                  fontWeight: FontWeight.w400,
                                  color: CommonColor.BLACK_COLOR
                              ),),


                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: 4.5,
                            itemSize: 20,
                            glow: false,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            onRatingUpdate: (rating) {
                              // myraiting = rating;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),



              ],
            ),
          ),

          SizedBox(
            height: parentHeight*0.03,
          )

        ],
      ),
    );
  }

  Widget getAllVehicleList(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.05,
          right: parentWidth*0.05,
          top: parentHeight*0.01),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)
        ),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.02,
                  top: parentHeight*0.01),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    children: [
                      Container(
                        height: parentHeight*0.085,
                        width: parentWidth*0.2,
                        decoration: BoxDecoration(
                            color: CommonColor.VEHICLE_DRIVER_IMG_COLOR,
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      Text("MH12 NT3456",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium',
                            height: parentHeight*0.002
                        ),),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.03,
                    top: parentHeight*0.005),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: parentWidth*0.54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Text("Type Of Vehicle",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(right: parentWidth*0.1),
                                    child: Text("RLW Kgs",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
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
                              Container(
                                width: parentWidth*0.34,
                                color: Colors.transparent,
                                child: Text("Trailer",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(right: parentWidth*0.1),
                                    child: Text("1550",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: parentHeight*0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Engine No.",
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Medium'
                                ),),

                              Padding(
                                padding: EdgeInsets.only(top: parentHeight*0.003),
                                child: Row(
                                  children: [
                                    Text("52WVC10338",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                    Row(
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: parentWidth*0.02),
                                          child: Container(
                                            height: SizeConfig.screenWidth*0.04,
                                            width: parentWidth*0.003,
                                            color: Colors.black12,
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(left: parentWidth*0.02),
                                          child: Container(
                                            color: Colors.transparent,
                                            width: parentWidth*0.36,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "L : 40 ft",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                      fontFamily: "Roboto_Regular",
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.only(left: parentWidth*0.05),
                                                  child: Text(
                                                    "W : 08 ft",
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
                                          ),
                                        ),

                                      ],
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

                ],
              ),
            ),

            SizedBox(
              height: parentHeight*0.01,
            )

          ],
        ),
      ),
    );
  }
}
