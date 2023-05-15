
import 'package:fixgotransporterapp/all_dialogs/register_success_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class AadhaarPanCardRegisterScreen extends StatefulWidget {
  const AadhaarPanCardRegisterScreen({Key? key}) : super(key: key);

  @override
  State<AadhaarPanCardRegisterScreen> createState() => _AadhaarPanCardRegisterScreenState();
}

class _AadhaarPanCardRegisterScreenState extends State<AadhaarPanCardRegisterScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController aadhaarNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final _userNameFocus = FocusNode();
  final _aadhaarNumberFocus = FocusNode();
  final _panNumberFocus = FocusNode();
  final _mobileNumberFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          Container(
            height: SizeConfig.screenHeight*0.12,
            color: CommonColor.APP_BAR_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.05),
                  child: Text("Registration",
                    style: TextStyle(
                        color: CommonColor.WHITE_COLOR,
                        fontSize: SizeConfig.blockSizeHorizontal*6.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto_Medium'
                    ),),
                ),
              ],
            ),
          ),

          SizedBox(
            height: SizeConfig.screenHeight*0.88,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
              children: [
                getAllFieldLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget getAllFieldLayout(double parentHeight, double parentWidth){
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.11,
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
            child:  Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: parentWidth*0.03,
                    right: parentWidth*0.03,
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    focusNode: _userNameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person,
                        color: Colors.black,),
                      label: RichText(
                        text: TextSpan(
                            text: 'User Name',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            ),
                            children: [
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      labelStyle: TextStyle(
                          color: CommonColor.REGISTER_HINT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          fontFamily: 'Roboto_Regular'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.04, top: parentHeight*0.01),
                      child: Text("( Write User Full Name )",
                        style: TextStyle(
                            color: CommonColor.REGISTER_HINT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: aadhaarNumberController,
                focusNode: _aadhaarNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,
                  color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Aadhaar Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: panNumberController,
                focusNode: _panNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Pan Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [

                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: mobileNumberController,
                focusNode: _mobileNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Mobile Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: otpController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Enter Your OTP',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [

                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.07,
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
                          child: RegisterSuccessDialog());
                    },
                  );
                },
                child: Container(
                  height: SizeConfig.screenHeight*0.057,
                  width: SizeConfig.screenWidth*0.7,
                  decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Register",
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
    );
  }
}
