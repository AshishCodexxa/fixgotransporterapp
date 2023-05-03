import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';



class WithdrawalCashHistoryScreen extends StatefulWidget {
  const WithdrawalCashHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawalCashHistoryScreen> createState() => _WithdrawalCashHistoryScreenState();
}

class _WithdrawalCashHistoryScreenState extends State<WithdrawalCashHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,),
        child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.only(
                bottom: SizeConfig.screenHeight * 0.02),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                        right: SizeConfig.screenWidth*0.05,
                        top: SizeConfig.screenHeight*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        RichText(
                          text: TextSpan(
                              text: '5 Feb. 2023',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                              ),
                              children: [
                                TextSpan(
                                    text: '   10:00',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto_Regular'))
                              ]),
                        ),

                        Text("Requested",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                        right: SizeConfig.screenWidth*0.05,
                        top: SizeConfig.screenHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: SizeConfig.screenWidth * 0.17,
                          height: SizeConfig.screenHeight * 0.023,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: CommonColor.FROM_AREA_COLOR),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text("Completed",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                                    fontFamily: "Roboto_Medium",
                                    fontWeight: FontWeight.w500,
                                    color: CommonColor.FROM_AREA_COLOR
                                ),),
                            ),
                          ),
                        ),

                        Text("Rs. 50",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
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



                ],
              );
            }
        ),
      ),
    );
  }
}
