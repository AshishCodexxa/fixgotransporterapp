
import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/vehicle_amount_pay_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {

  int count = 0;

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

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                      left: SizeConfig.screenWidth*0.03,
                      right: SizeConfig.screenWidth*0.03),
                  child: Container(
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
                    child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                  ),
                ),

                getBookingPayDetailsAndAmount(SizeConfig.screenHeight, SizeConfig.screenWidth)

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
            child: Text("Interested Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }



  Widget getInfoCardLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.012),
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
              Padding(
                padding: EdgeInsets.only(right: parentWidth*0.05,),
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
                      padding: EdgeInsets.only(top: parentHeight*0.001),
                      child: Row(
                        children: [
                          Text("(Transport Fare)",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*2.0,
                                height: parentHeight*0.002
                            ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          Row(
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
                                  child: LoadMoreInfoDialog(isComeFrom: '',));
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
                left: SizeConfig.screenWidth*0.012),
            child: CustomPaint(painter: DrawDottedhorizontalline()),
          ),

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Icon(Icons.verified_user,
                                  size: parentHeight*0.016,),

                                Text("Verified",
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
              ],
            ),
          ),

          SizedBox(
            height: parentHeight*0.015,
          )

        ],
      ),
    );
  }

  Widget getBookingPayDetailsAndAmount(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
          left: SizeConfig.screenWidth*0.03,
          right: SizeConfig.screenWidth*0.03),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
              left: SizeConfig.screenWidth*0.03,
              right: SizeConfig.screenWidth*0.03),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Raj Vehicle",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Pune",
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
                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                  Text("Vehicle Available on : 1 Feb 23",
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
                  Text("No. of Vehicle",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400,
                      color: CommonColor.BLACK_COLOR
                  ),),
                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.03,
                          top: parentHeight*0.01),
                      child: Row(
                        children: [

                          GestureDetector(onTap: (){
                            if(mounted){
                              setState(() {
                                count--;
                              });
                            }
                          },
                            child: Container(
                              height: parentHeight*0.027,
                              width: parentWidth*0.07,
                              decoration: BoxDecoration(
                                  color: CommonColor.ADVANCE_INCREMENT_COLOR,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Icon(Icons.remove,
                                color: Colors.white,
                                size: parentHeight*0.02,),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: parentWidth*0.02, right: parentWidth*0.02),
                            child: Text("$count",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Regular'
                              ),),
                          ),

                          GestureDetector(
                            onTap: (){
                              if(mounted){
                                setState(() {
                                  count++;
                                });
                              }
                            },
                            child: Container(
                              height: parentHeight*0.027,
                              width: parentWidth*0.07,
                              decoration: BoxDecoration(
                                  color: CommonColor.ADVANCE_INCREMENT_COLOR,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Icon(Icons.add,
                                color: Colors.white,
                                size: parentHeight*0.02,),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
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

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Fixed Price",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                          color: CommonColor.BLACK_COLOR
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
                                text: ' 10000/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    color: Colors.black,
                                    fontFamily: 'Roboto_Medium',
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Advance Payment",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                          color: CommonColor.BLACK_COLOR
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
                                text: ' 5000/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    color: Colors.black,
                                    fontFamily: 'Roboto_Medium',
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.03,
                  left: SizeConfig.screenWidth*0.05,
                  right: SizeConfig.screenWidth*0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){

                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return const AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 2),
                                child: VehicleAmountPayDialog(isComeFrom: '2',));
                          },
                        );

                      },
                      child: Container(
                        height: SizeConfig.screenHeight*0.05,
                        width: SizeConfig.screenWidth*0.7,
                        decoration: BoxDecoration(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Pay Now",
                            style: TextStyle(
                                color: CommonColor.WHITE_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Medium'
                            ),),
                        ),
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
        ),
      ),
    );
  }



}
