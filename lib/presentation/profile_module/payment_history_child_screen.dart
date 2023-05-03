import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';




class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,),
        child:  ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.only(
                bottom: SizeConfig.screenHeight * 0.02),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03,
                        right: SizeConfig.screenWidth*0.03,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Container(
                                height: SizeConfig.screenHeight*0.052,
                                width: SizeConfig.screenWidth*0.12,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Received From",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black
                                    ),),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01, left: SizeConfig.screenWidth*0.03),
                                    child: Text("XYZ Company",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                          fontFamily: "Roboto_Regular",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),),
                                  ),
                                ],
                              ),
                            ],
                          ),



                          Text("Rs. 2000",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03, right: SizeConfig.screenWidth*0.03,
                          top: SizeConfig.screenHeight*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("1 day ago",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w500,
                                color: Colors.black38
                            ),),

                          Text("Credited to GPAY",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w500,
                                color: Colors.black54
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
                ),
              );
            }
        ),
      ),
    );
  }
}
