
import 'package:fixgotransporterapp/all_dialogs/get_company_vehicle_review_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class VehicleCashAmountPayDialog extends StatefulWidget {


  const VehicleCashAmountPayDialog({Key? key}) : super(key: key);

  @override
  State<VehicleCashAmountPayDialog> createState() => _VehicleCashAmountPayDialogState();
}

class _VehicleCashAmountPayDialogState extends State<VehicleCashAmountPayDialog> {
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
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                      child: Text("XYZ Company",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*6.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                      child: Text("Pune , Maharashtra",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01, left: SizeConfig.screenWidth*0.1,
                          right: SizeConfig.screenWidth*0.1),
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Rs.5000/-",
                                    style: TextStyle(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal * 7.0,
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.BLACK_COLOR,
                                        fontFamily: 'Roboto_Medium')
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight*0.01,
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.00),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Due Payment In Cash" ,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ],
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
                            onDoubleTap: (){},
                            onTap: (){
                              Navigator.pop(context);

                              showCupertinoDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return const AnimatedOpacity(
                                      opacity: 1.0,
                                      duration: Duration(seconds: 2),
                                      child: GetCompanyVehicleReview());
                                },
                              );


                            },
                            child: Container(
                              height: SizeConfig.screenHeight*0.045,
                              width: SizeConfig.screenWidth*0.32,
                              decoration: BoxDecoration(
                                  color: CommonColor.ACCEPT_PAYMENT_COLOR,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text("Accept",
                                  style: TextStyle(
                                      color: CommonColor.WHITE_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: SizeConfig.screenHeight*0.045,
                              width: SizeConfig.screenWidth*0.32,
                              decoration: BoxDecoration(
                                  color: CommonColor.DECLINE_PAYMENT_COLOR,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text("Decline",
                                  style: TextStyle(
                                      color: CommonColor.WHITE_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.5,
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
                      height: SizeConfig.screenHeight*0.03,
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
