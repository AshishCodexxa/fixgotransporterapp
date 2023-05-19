import 'package:fixgotransporterapp/all_dialogs/bid_now_price_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class PendingBidScreen extends StatefulWidget {
  const PendingBidScreen({Key? key}) : super(key: key);

  @override
  State<PendingBidScreen> createState() => _PendingBidScreenState();
}

class _PendingBidScreenState extends State<PendingBidScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
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
            );
          }
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth){
    return Column(
      children: [

        Container(
          height: parentHeight*0.04,
          decoration: BoxDecoration(
            color: CommonColor.LOWEST_BID_CONTAINER_COLOR,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      "Lowest Bid 9800/-",
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    Container(
                      color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: parentWidth*0.01),
                                child: Icon(Icons.person,
                                size: parentHeight*0.03,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: parentHeight*0.01),
                                child: Container(
                                  height: parentHeight*0.017,
                                  width: parentWidth*0.037,
                                  decoration: BoxDecoration(
                                    color: CommonColor.SAME_BID_COUNT_COLOR,
                                    shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: CommonColor.WHITE_COLOR,
                                          fontSize: SizeConfig.blockSizeHorizontal*2.0,
                                          fontFamily: "Roboto_Medium",
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    )

                  ],
                ),
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
              ],
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05,
              top: parentHeight*0.01),
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
                          width: parentWidth*0.55,
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
                          width: parentWidth*0.55,
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
                          child: BidNowPriceDialog(isComeFrom: '2', mainPrice: 2000,),
                        );
                      });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
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
                                      fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Icon(Icons.edit,
                        color: Colors.black,
                        size: parentHeight*0.02,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Post on 26th Jan 2023 | 10:30 am",
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
            Padding(
              padding: EdgeInsets.only(right: parentWidth*0.05,
                  top: parentHeight*0.01),
              child: Container(
                width: parentWidth*0.2,
                height: parentHeight*0.023,
                decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.BOOKING_CONFIRM_COLOR),
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Bidding in Process",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*2.0,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w500,
                          color: CommonColor.BOOKING_CONFIRM_COLOR
                      ),),
                  ),
                ),
              ),
            )
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
                        "Pick-up Time",
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
                          "02:00 pm",
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
              left: parentWidth*0.012),
          child: CustomPaint(painter: DrawDottedhorizontalline()),
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.05,
              top: parentHeight*0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Qty Of Load : ',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                            ),
                            children: [
                              TextSpan(
                                  text: '10 Ton(s)',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto_Regular'))
                            ]),
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
        ),

        SizedBox(
          height: parentHeight*0.01,
        )

      ],
    );
  }
}
