
import 'package:fixgotransporterapp/all_dialogs/kyc_otp_verify_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class KYCVerifyScreen extends StatefulWidget {
  const KYCVerifyScreen({Key? key}) : super(key: key);

  @override
  State<KYCVerifyScreen> createState() => _KYCVerifyScreenState();
}

class _KYCVerifyScreenState extends State<KYCVerifyScreen> {


  TextEditingController aadhaarController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                  child: Text("KYC Verification",
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
            top: parentHeight*0.05,
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
            child:  Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: parentWidth*0.03,
                    right: parentWidth*0.03,
                  ),
                  child: TextFormField(
                    controller: aadhaarController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person,
                        color: Colors.black,),
                      label: RichText(
                        text: TextSpan(
                            text: 'Aadhar Number',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            ),
                            children: [
                              TextSpan(
                                  text: ' *',
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
              ],
            ),
          ),
        ),


        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.01,
              top: parentHeight*0.07),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.03),
                child: Text("Note :",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Medium'
                  ),),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.05,
              top: parentHeight*0.01),
          child: Row(
            children: [

              Container(
                height: parentHeight*0.013,
                width: parentWidth*0.02,
                decoration: BoxDecoration(
                    color: Colors.black54,
                  shape: BoxShape.circle
                ),
              ),


          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.03),
            child: Text("Aadhaar Card should be of the same person",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Medium'
                  ),),
          ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.05,
              top: parentHeight*0.005),
          child: Row(
            children: [

              Container(
                height: parentHeight*0.013,
                width: parentWidth*0.02,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.03),
                child: Text("Verification will be completed within 48Hrs",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Medium'
                  ),),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.15,
            left: SizeConfig.screenWidth*0.05,
            right: SizeConfig.screenWidth*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
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
                          child: const KYCOtpVerify(),
                        );
                      });

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => KYCVerifyScreen()));
                },
                child: Container(
                  height: SizeConfig.screenHeight*0.057,
                  width: SizeConfig.screenWidth*0.7,
                  decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Get OTP",
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
      ],
    );
  }
}
