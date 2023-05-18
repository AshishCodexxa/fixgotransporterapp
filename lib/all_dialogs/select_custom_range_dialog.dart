import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class CustomRangeCalenderDialog extends StatefulWidget {
  const CustomRangeCalenderDialog({Key? key}) : super(key: key);

  @override
  State<CustomRangeCalenderDialog> createState() => _CustomRangeCalenderDialogState();
}

class _CustomRangeCalenderDialogState extends State<CustomRangeCalenderDialog> {


  String fromDate = "";

  String toDate = "";

  DateTime? pickedDates;


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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                            child: Text("Select Custom Range",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Medium'
                              ),),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                              top: SizeConfig.screenHeight*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("From",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Medium'
                                ),),

                              Padding(
                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                child: GestureDetector(
                                  onTap: () async {
                                    pickedDates = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(const Duration(days: 1)),
                                      lastDate: DateTime(2100),

                                    );


                                    if (pickedDates != null) {
                                      print(
                                          pickedDates);
                                      fromDate =
                                          DateFormat('dd-MM-yyyy').format(pickedDates!);



                                      print(
                                          fromDate);
                                      setState(() {

                                      });
                                    } else {}


                                  },
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.05,
                                    width: SizeConfig.screenWidth*0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(color: Colors.black54)
                                    ),
                                    child: Center(
                                      child: Text( fromDate.isEmpty ? "DD/MM/YYYY" : fromDate,
                                        style: TextStyle(
                                            color: fromDate.isEmpty ? Colors.black26 : CommonColor.BLACK_COLOR,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto_Medium'
                                        ),),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                              top: SizeConfig.screenHeight*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("To",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Medium'
                                ),),

                              Padding(
                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                child: GestureDetector(
                                  onTap: () async {
                                    pickedDates = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(const Duration(days: 1)),
                                      lastDate: DateTime(2100),

                                    );


                                    if (pickedDates != null) {
                                      print(
                                          pickedDates);
                                      toDate =
                                          DateFormat('dd-MM-yyyy').format(pickedDates!);



                                      print(
                                          fromDate);
                                      setState(() {

                                      });
                                    } else {}


                                  },
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.05,
                                    width: SizeConfig.screenWidth*0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: Colors.black54)
                                    ),
                                    child: Center(
                                      child: Text( toDate.isEmpty ? "DD/MM/YYYY" : toDate,
                                        style: TextStyle(
                                            color: toDate.isEmpty ? Colors.black26 : CommonColor.BLACK_COLOR,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto_Medium'
                                        ),),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),


                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03,
                      left: SizeConfig.screenWidth*0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: SizeConfig.screenHeight*0.04,
                            width: SizeConfig.screenWidth*0.2,
                            decoration: BoxDecoration(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text("Apply",
                                style: TextStyle(
                                    color: CommonColor.WHITE_COLOR,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Regular'
                                ),),
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
