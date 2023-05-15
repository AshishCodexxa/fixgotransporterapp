import 'dart:async';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';



class OtpPutScreen extends StatefulWidget {
  const OtpPutScreen({Key? key}) : super(key: key);

  @override
  State<OtpPutScreen> createState() => _OtpPutScreenState();
}

class _OtpPutScreenState extends State<OtpPutScreen>  with TickerProviderStateMixin {

  String otpCode = "";

  int secondsRemaining = 30;
  bool enableResend = false;
  bool reSendCode = false;
  bool timeVisible = false;
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 1) {
          if(mounted) {
            setState(() {
            timer.cancel();
            reSendCode = true;
            timeVisible = false;
          });
          }
        } else {
          if(mounted) {
            setState(() {
            _start--;
            reSendCode = false;
            timeVisible = true;
          });
          }
        }
      },
    );
  }


  @override
  void initState() {
    _listenOtp();
    super.initState();
    startTimer();
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
    print("OTP Listen is called");
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("Unregistered Listener");
    _timer?.cancel();
    super.dispose();
  }

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
                      Text("Enter OTP",
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
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03,
                  left: SizeConfig.screenWidth*0.05,
                  right: SizeConfig.screenWidth*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter the four digit code we sent to you",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),

                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                            left: SizeConfig.screenWidth*0.0,
                            right: SizeConfig.screenWidth*0.03),
                        child: Text("+911234567890",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.05,
                  left: SizeConfig.screenWidth*0.07,
                  right: SizeConfig.screenWidth*0.07),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      inputDecorationTheme: const InputDecorationTheme(
                        fillColor: Color(0xfff5f5f5),
                        filled: false,
                      ),
                    ),
                    child: PinFieldAutoFill(
                      currentCode: otpCode,
                      decoration:  BoxLooseDecoration(
                          radius: Radius.circular(7),
                          strokeColorBuilder: FixedColorBuilder(
                              Color(0xFF8C4A52)
                          ),

                      ),
                      codeLength: 6,
                      onCodeChanged: (code) {
                        print("OnCodeChanged : $code");
                        otpCode = code.toString();
                      },
                      onCodeSubmitted: (val) {
                        print("OnCodeSubmitted : $val");
                      },
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
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyRegistration()));


                        },
                        child: Container(
                          height: SizeConfig.screenHeight*0.05,
                          width: SizeConfig.screenWidth*0.7,
                          decoration: BoxDecoration(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Next",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01,
                          top: SizeConfig.screenHeight*0.02),
                      child: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).requestFocus(FocusNode());
                          reSendCode=false;
                          if(mounted) {
                            setState(() {
                            _start=60;
                            timeVisible = true;
                            const oneSec = const Duration(seconds: 1);
                            _timer = Timer.periodic(
                              oneSec,
                                  (Timer timer) {
                                if (_start == 1) {
                                  if(mounted) {
                                    setState(() {
                                    timer.cancel();
                                    reSendCode = true;
                                    timeVisible = false;
                                  });
                                  }
                                } else {
                                  if(mounted) {
                                    setState(() {
                                    _start--;
                                    reSendCode = false;
                                    timeVisible = true;
                                  });
                                  }
                                }
                              },
                            );
                          });
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: RichText(
                              text: TextSpan(
                                  text: "Didn’t receive SMS?",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 13),
                                  children: [
                                    TextSpan(
                                        text: " Resend",
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
                ),

                Visibility(
                  visible: timeVisible,
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_start s',
                          style: TextStyle(
                              color:_start > 10 ? Colors.black : Colors.red,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontFamily: 'Roboto_Bold'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

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
