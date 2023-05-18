import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';



class AddFundScreen extends StatefulWidget {
  const AddFundScreen({Key? key}) : super(key: key);

  @override
  State<AddFundScreen> createState() => _AddFundScreenState();
}

class _AddFundScreenState extends State<AddFundScreen> {


  int index = -1;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

         Container(
                    color: CommonColor.WHITE_COLOR,
                    height: SizeConfig.safeUsedHeight * .88,
                    child: getAllLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
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
            child: Text("Add Funds",
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

  Widget getAllLayout(double parentHeight, double parentWidth){
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.03,
          right: parentWidth*0.03,
          top: parentHeight*0.03),
          child: Container(
            height: parentHeight*0.07,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 7,
                    spreadRadius: 1,
                    offset: const Offset(2, 2)),
              ],
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.only(left: parentWidth*0.03,
                  right: parentWidth*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Balance",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*5.0,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w500,
                        color: CommonColor.BLACK_COLOR
                    ),),

                  Text("\u{20B9}  2000",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*5.5,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w400,
                        color: CommonColor.BLACK_COLOR
                    ),),

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
          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.04,
              left: parentWidth*0.5),
          child: CustomPaint(painter: DrawDottedhorizontalline()),
        ),

        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.03, left: parentWidth*0.03,right: parentWidth*0.03),
          child: Column(
            children: [

              Row(
                children: [
                  Text("Select Bank Account",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),),
                ],
              ),

            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.03,
              right: parentWidth*0.03,
              top: parentHeight*0.03),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: const Offset(2, 2)),
                ],
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [

                for(int i = 0; i < 1; i++)

                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.03,
                      right: parentWidth*0.03,
                  top: parentHeight*0.02),
                  child: GestureDetector(
                    onTap: (){

                      if(index != i){
                        index = i;
                        if(mounted){
                          setState(() {

                          });
                        }
                      }else{
                        index = -1;
                        if(mounted){
                          setState(() {

                          });
                        }
                      }


                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Bank of Maharashtra",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w500,
                                color: CommonColor.BLACK_COLOR
                            ),),

                          Container(
                            height: parentHeight*0.03,
                            width: parentWidth*0.06,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                shape: BoxShape.circle,
                                color: i == index ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: parentHeight*0.02,
                )
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.03, left: parentWidth*0.03,right: parentWidth*0.03),
          child: Column(
            children: [

              Row(
                children: [
                  Text("Pay With",
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
                    top: parentHeight*0.03,
                left: parentWidth*0.03,
                right: parentWidth*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.03,
                          width: SizeConfig.screenWidth*0.07,
                          color: Colors.black26,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Row(
                            children: [
                              Text("UPI",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),


                    Icon(Icons.arrow_forward_ios_rounded,
                    size: parentHeight*0.02,)



                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.015),
                child: Container(
                  height: parentHeight*0.001,
                  color: Colors.black12,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: parentHeight*0.015,
                    left: parentWidth*0.03,
                    right: parentWidth*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.03,
                          width: SizeConfig.screenWidth*0.07,
                          color: Colors.black26,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Row(
                            children: [
                              Text("Google Pay",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),


                    Icon(Icons.arrow_forward_ios_rounded,
                      size: parentHeight*0.02,)



                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.015),
                child: Container(
                  height: parentHeight*0.001,
                  color: Colors.black12,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: parentHeight*0.015,
                    left: parentWidth*0.03,
                    right: parentWidth*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.03,
                          width: SizeConfig.screenWidth*0.07,
                          color: Colors.black26,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Row(
                            children: [
                              Text("Net Banking",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),


                    Icon(Icons.arrow_forward_ios_rounded,
                      size: parentHeight*0.02,)



                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.015),
                child: Container(
                  height: parentHeight*0.001,
                  color: Colors.black12,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: parentHeight*0.015,
                    left: parentWidth*0.03,
                    right: parentWidth*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.03,
                          width: SizeConfig.screenWidth*0.07,
                          color: Colors.black26,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Row(
                            children: [
                              Text("Others",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),


                    Icon(Icons.arrow_forward_ios_rounded,
                      size: parentHeight*0.02,)



                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.015),
                child: Container(
                  height: parentHeight*0.001,
                  color: Colors.black12,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.05,
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
          ),
        ),
      ],
    );
  }
}
