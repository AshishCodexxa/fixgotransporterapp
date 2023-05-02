import 'dart:async';

import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/login_registration/transporter_registeration_screen.dart';
import 'package:flutter/material.dart';





class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var durtaion = new Duration(seconds: 2);
    return Timer(durtaion, navigateParentPage);
  }


  void navigateParentPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyRegistration()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.screenHeight*0.2,
                width: SizeConfig.screenWidth*0.45,
                color: CommonColor.UNSELECT_TYPE_COLOR,
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Transporter',
                  style: TextStyle(
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal*9.0,
                    fontFamily: 'Roboto_Bold'
                  ),),
              ],
            ),
          )

        ],
      ),
    );
  }
}
