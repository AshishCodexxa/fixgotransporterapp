import 'dart:async';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';






class LoadPostSuccessDialog extends StatefulWidget {
  const LoadPostSuccessDialog({Key? key}) : super(key: key);

  @override
  State<LoadPostSuccessDialog> createState() => _LoadPostSuccessDialogState();
}

class _LoadPostSuccessDialogState extends State<LoadPostSuccessDialog> {


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var durtaion = new Duration(seconds: 3);
    return Timer(durtaion, navigateParentPage);
  }


  void navigateParentPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * .09,
            right: SizeConfig.screenWidth * .09),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child:  Container(
            decoration:  const BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(25.0)),
              //color: CommonColor.RED_COLOR,
            ),
            child:  Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.05),
                      child: Image(image: AssetImage("assets/images/register_success_tick.png")),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                      child: Text("Successfully Posted ",
                        style: TextStyle(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*5.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your Load Is Posted Successfully",
                            style: TextStyle(
                                color: CommonColor.BLACK_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.screenHeight*0.05,
                    )

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(Icons.clear,
                        color: Colors.black,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
