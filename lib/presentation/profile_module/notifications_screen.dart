
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';




class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Container(
            height: SizeConfig.screenHeight*0.88,
            child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.only(
                    bottom: SizeConfig.screenHeight * 0.02),
                itemBuilder: (BuildContext context, int index) {
                  return getAllNotificationLayout(SizeConfig.screenHeight, SizeConfig.screenWidth);
                }
            ),
          )


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
            child: Text("Notification",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*5.5,
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

  Widget getAllNotificationLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03, right: parentWidth*0.03,
      top: parentHeight*0.02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 6)),
          ],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05,
              top: parentHeight*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification 1",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                        fontFamily: "Roboto_Medium",
                        fontWeight: FontWeight.w500,
                        color: CommonColor.BLACK_COLOR
                    ),),

                  Text("30 min ago",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                        fontFamily: "Roboto_Medium",
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05,
                  top: parentHeight*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Mahesh Transporter",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w500,
                        color: CommonColor.BLACK_COLOR
                    ),),

                  ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05,
                  top: parentHeight*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Type Of Load",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        fontFamily: "Roboto_Medium",
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),

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
                              text: ' 400/-',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05,
                  top: parentHeight*0.007),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    width: parentWidth*0.81,
                    child: RichText(
                      text: TextSpan(
                          text: 'Pack Load',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          ),
                          children: [
                            TextSpan(
                                text: '  (Lorem Ipsum is simply dummy) ',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Regular'))
                          ]),
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
      ),
    );
  }
}
