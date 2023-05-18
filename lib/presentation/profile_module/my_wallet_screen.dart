import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/profile_module/add_fund_screen.dart';
import 'package:flutter/material.dart';




class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
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
            child: CustomScrollView(
              slivers: <Widget>[

                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                            left: SizeConfig.screenWidth*0.03,
                            right: SizeConfig.screenWidth*0.03),
                            child: Container(
                              height: SizeConfig.screenHeight*0.17,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: const Offset(2, 6)),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Net Earning",
                                        style: TextStyle(
                                            fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                            fontFamily: "Roboto_Regular",
                                            fontWeight: FontWeight.w500,
                                            color: CommonColor.BLACK_COLOR
                                        ),),
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("32597.00",
                                          style: TextStyle(
                                              fontSize: SizeConfig.blockSizeHorizontal*6.0,
                                              fontFamily: "Roboto_Bold",
                                              fontWeight: FontWeight.w500,
                                              color: CommonColor.BLACK_COLOR
                                          ),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.03,
                              left: SizeConfig.screenWidth*0.05,
                              right: SizeConfig.screenWidth*0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFundScreen()));

                                  },
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.055,
                                    width: SizeConfig.screenWidth*0.35,
                                    decoration: BoxDecoration(
                                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                          child: Container(
                                            height: SizeConfig.screenHeight*0.023,
                                            width: SizeConfig.screenWidth*0.05,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.02),
                                          child: Text("Add Funds",
                                            style: TextStyle(
                                                color: CommonColor.WHITE_COLOR,
                                                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto_Regular'
                                            ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  
                                  onTap: (){
                                    Navigator.pop(context);

                                  },
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.055,
                                    width: SizeConfig.screenWidth*0.35,
                                    decoration: BoxDecoration(
                                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                          child: Container(
                                            height: SizeConfig.screenHeight*0.023,
                                            width: SizeConfig.screenWidth*0.05,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.02),
                                          child: Text("Withdrawal",
                                            style: TextStyle(
                                                color: CommonColor.WHITE_COLOR,
                                                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto_Regular'
                                            ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                              left: SizeConfig.screenWidth*0.03,
                              right: SizeConfig.screenWidth*0.03),
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
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                                left: SizeConfig.screenWidth*0.03,
                                right: SizeConfig.screenWidth*0.03),
                            child: Container(
                              height: SizeConfig.screenHeight*0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: const Offset(2, 6)),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.screenWidth*0.05,
                                    right: SizeConfig.screenWidth*0.05),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Trips",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                          fontFamily: "Roboto_Medium",
                                          fontWeight: FontWeight.w500,
                                          color: CommonColor.BLACK_COLOR
                                      ),),
                                    Text("20",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*6.0,
                                          fontFamily: "Roboto_Medium",
                                          fontWeight: FontWeight.w500,
                                          color: CommonColor.BLACK_COLOR
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                                left: SizeConfig.screenWidth*0.03,
                                right: SizeConfig.screenWidth*0.03),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Recent Trips",
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontFamily: "Roboto_Bold",
                                      fontWeight: FontWeight.w500,
                                      color: CommonColor.BLACK_COLOR
                                  ),),

                                Text("View All",
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontFamily: "Roboto_Bold",
                                      fontWeight: FontWeight.w500,
                                      color: CommonColor.BLACK_COLOR
                                  ),),

                              ],
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 3,
                            (context, index) {
                          return getTripList(SizeConfig.screenHeight, SizeConfig.screenWidth);
                        },
                      )
                  ),
                ),


              ],
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
            child: Text("My Wallet",
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

  Widget getTripList(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
          left: SizeConfig.screenWidth*0.03,
          right: SizeConfig.screenWidth*0.03),
      child: Container(
        height: SizeConfig.screenHeight*0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 6)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.screenHeight*0.01,
              left: SizeConfig.screenWidth*0.05,
              right: SizeConfig.screenWidth*0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ID : 458691",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),
                  Text(" 27th Jan 2023 ",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
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
                                      fontFamily: "Roboto_Regular",
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
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
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
                                text: ' 490/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
