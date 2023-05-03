
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/booking_details_screen.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/vehicle_owner_info_profile.dart';
import 'package:flutter/material.dart';




class InterestedVehicleOwnerList extends StatefulWidget {
  const InterestedVehicleOwnerList({Key? key}) : super(key: key);

  @override
  State<InterestedVehicleOwnerList> createState() => _InterestedVehicleOwnerListState();
}

class _InterestedVehicleOwnerListState extends State<InterestedVehicleOwnerList> {
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
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
              children: [
                getAllListLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)
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
            onDoubleTap: (){},
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
            child: Text("Interested Vehicle Owner",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*5.7,
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
  
  Widget getAllListLayout(double parentHeight, double parentWidth){
    return Container(
      height: SizeConfig.safeUsedHeight * .88,
      child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight*0.02,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: GestureDetector(
                    onDoubleTap: (){},
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleOwnerInfoProfile()));
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Mahesh Transporter",
                                style: TextStyle(
                                    color: CommonColor.BLACK_COLOR,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Regular'
                                ),),

                              RichText(
                                text: TextSpan(
                                    text: '\u{20B9}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: ' 2000/-',
                                          style: TextStyle(
                                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))
                                    ]),
                              ),

                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Pune",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Regular'
                                  ),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Vehicle Available on : 1 Feb 23",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Regular'
                                  ),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.002),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth*0.11,
                                  height: SizeConfig.screenHeight*0.023,
                                  decoration: BoxDecoration(
                                    color: CommonColor.SELECT_TYPE_COLOR,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Padding(
                                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                        child: Text("4.5",
                                          style: TextStyle(
                                              color: CommonColor.WHITE_COLOR,
                                              fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Medium'
                                          ),),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.017),
                                        child: Icon(Icons.star,
                                          size: SizeConfig.blockSizeHorizontal*2.5,
                                          color: Colors.white,),
                                      )

                                    ],
                                  ),
                                ),

                                GestureDetector(
                                  onDoubleTap: (){},
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDetailsScreen()));
                                  },
                                  child: Container(
                                    width: SizeConfig.screenWidth*0.18,
                                    height: SizeConfig.screenHeight*0.03,
                                    decoration: BoxDecoration(
                                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text("Book Now",
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
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
              ],
            );
          }
      ),
    );
  }
}
