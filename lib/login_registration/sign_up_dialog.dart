
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/login_registration/transporter_details_register_screen.dart';
import 'package:flutter/material.dart';




class SignUpDialog extends StatefulWidget {
  const SignUpDialog({Key? key}) : super(key: key);

  @override
  State<SignUpDialog> createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.APP_BAR_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            // height: SizeConfig.screenWidth*0.99,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: CommonColor.WHITE_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign Up",
                      style: TextStyle(
                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                        fontSize: SizeConfig.blockSizeHorizontal*6.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto_Medium'
                      ),),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.04,
                  left: SizeConfig.screenWidth*0.22,
                  right: SizeConfig.screenWidth*0.22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          Container(
                            height: SizeConfig.screenHeight*0.085,
                            width: SizeConfig.screenWidth*0.17,
                            decoration: const BoxDecoration(
                              color:CommonColor.SELECT_TYPE_COLOR,
                              shape: BoxShape.circle
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
                            child: Text("Company",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Bold'
                              ),),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            height: SizeConfig.screenHeight*0.085,
                            width: SizeConfig.screenWidth*0.17,
                            decoration: const BoxDecoration(
                                color:CommonColor.UNSELECT_TYPE_COLOR,
                                shape: BoxShape.circle
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
                            child: Text("Receiver",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Bold'
                              ),),
                          ),
                        ],
                      )

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.04,
                  left: SizeConfig.screenWidth*0.05,
                  right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Column(
                          children: <Widget>[
                            Checkbox(

                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
                            child: RichText(
                                text: const TextSpan(
                                    text: "I have read and agree to Fix Go",
                                    style: TextStyle(
                                        color: CommonColor.BLACK_COLOR,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 13),
                                    children: [
                                      TextSpan(
                                          text: " Privacy Policy ",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 13)),
                                      TextSpan(
                                          text: "and\n",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 13)),
                                      TextSpan(
                                        text: "Terms of Service.\n",
                                        style: TextStyle(
                                            color: CommonColor.BLACK_COLOR,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 13),
                                      )
                                    ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyRegistration()));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TransporterDetailsScreen()));
                        },
                        child: Container(
                          height: SizeConfig.screenHeight*0.057,
                          width: SizeConfig.screenWidth*0.7,
                          decoration: BoxDecoration(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Register Now",
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

                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01,
                      top: SizeConfig.screenHeight*0.02),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: RichText(
                              text: TextSpan(
                                  text: "Already have an Account?",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 13),
                                  children: [
                                    TextSpan(
                                        text: " Sign In",
                                        style: TextStyle(
                                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                        decoration: TextDecoration.underline,)),
                                  ])),
                        ),
                      ),
                    ),
                  ],
                ),*/

                SizedBox(
                  height: SizeConfig.screenHeight*0.03,
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
