import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';




class WithdrawalRequestScreen extends StatefulWidget {
  const WithdrawalRequestScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawalRequestScreen> createState() => _WithdrawalRequestScreenState();
}

class _WithdrawalRequestScreenState extends State<WithdrawalRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          getAllBalanceSheet(SizeConfig.screenHeight, SizeConfig.screenWidth),


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
            child: Text("Withdrawal",
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

  Widget getAllBalanceSheet(double parentHeight, double parentWidth){
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: parentWidth*0.03,
              top: parentHeight*0.02,
              right: parentWidth*0.03),
          child: Container(
            height: parentHeight*0.26,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 7,
                    spreadRadius: 3,
                    offset: const Offset(2, 2))
              ],
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: parentWidth*0.03,
              top: parentHeight*0.02,
              right: parentWidth*0.03),
              child: Column(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left: parentWidth*0.03,
                        right: parentWidth*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Text("Closing Balance",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
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
                                    text: ' 2000/-',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: parentWidth*0.03,
                        right: parentWidth*0.03,
                    top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Text("Unsettled Credits ( - )",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
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
                                    text: ' 0/-',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: parentWidth*0.03,
                        right: parentWidth*0.03,
                    top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Text("Payin ( - )",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
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
                                    text: ' 0/-',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: parentWidth*0.03,
                        right: parentWidth*0.03,
                    top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Text("Collateral utilized ( + )",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
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
                                    text: ' 0/-',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: parentWidth*0.03,
                        right: parentWidth*0.03,
                        top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Text("Withdrawable Balance",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              color: CommonColor.BLACK_COLOR
                          ),),


                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.01),
                          child: Icon(Icons.info_outline,
                          size: parentHeight*0.02,),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: parentWidth*0.03,
                        right: parentWidth*0.03,
                        top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: '\u{20B9}',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Medium',
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*5.0,
                              ),
                              children: [
                                TextSpan(
                                    text: '  2000/-',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                        color: Colors.black,
                                        fontFamily: 'Roboto_Medium',
                                        fontWeight: FontWeight.w400))
                              ]),
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
          padding: EdgeInsets.only(top: parentHeight*0.03, left: parentWidth*0.03,right: parentWidth*0.03),
          child: Column(
            children: [

              Row(
                children: [
                  Text("Amount to Withdraw",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: parentHeight*0.015),
                child: Container(
                  height: parentHeight*0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.black12)
                  ),
                  child: Row(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.03),
                        child: Icon(Icons.currency_rupee,
                          color: Colors.black,
                          size: parentHeight*0.025,),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: parentHeight*0.01),
                          child: TextFormField(
                            // controller: quantityLoadController,
                            // focusNode: _userNameFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter Amount",
                              hintStyle: TextStyle(
                                color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*6.0,
                              ),
                              contentPadding: EdgeInsets.only(left: parentWidth*0.05,
                                  right: parentWidth*0.05,
                                  bottom: parentHeight*0.017),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                            ),
                            style: TextStyle(
                              color: CommonColor.BLACK_COLOR,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*6.0,
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
        ),

        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.1,
              left: parentWidth*0.1,
              right: parentWidth*0.1),
          child: GestureDetector(
            onTap: (){
              // showCupertinoDialog(
              //   context: context,
              //   barrierDismissible: true,
              //   builder: (context) {
              //     return const AnimatedOpacity(
              //         opacity: 1.0,
              //         duration: Duration(seconds: 2),
              //         child: LoadPostSuccessDialog());
              //   },
              // );
            },
            child: Container(
              height: parentHeight*0.055,
              width: parentWidth*0.75,
              decoration: BoxDecoration(
                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Continue",
                  style: TextStyle(
                      color: CommonColor.WHITE_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal*5.0,
                      fontFamily: 'Roboto_Bold'
                  ),),
              ),
            ),
          ),
        )
      ],
    );
  }
}
