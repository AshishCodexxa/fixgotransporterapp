import 'package:fixgotransporterapp/all_dialogs/select_custom_range_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class StatisticsDetailsScreen extends StatefulWidget {
  const StatisticsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsDetailsScreen> createState() => _StatisticsDetailsScreenState();
}

class _StatisticsDetailsScreenState extends State<StatisticsDetailsScreen> {


  String selectFilter = "";

  bool showFilter = false;
  bool hideFilterName = true;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.1,
                        left: SizeConfig.screenWidth*0.03,
                        right: SizeConfig.screenWidth*0.03),
                    child: Container(
                      height: SizeConfig.screenHeight*0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 6)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth*0.05,
                            right: SizeConfig.screenWidth*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Trips",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w500,
                                  color: CommonColor.BLACK_COLOR
                              ),),
                            Text("20",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w500,
                                  color: CommonColor.BLACK_COLOR
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.05,
                        left: SizeConfig.screenWidth*0.03,
                        right: SizeConfig.screenWidth*0.03),
                    child: Container(
                      height: SizeConfig.screenHeight*0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 6)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth*0.05,
                            right: SizeConfig.screenWidth*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Earnings",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w500,
                                  color: CommonColor.BLACK_COLOR
                              ),),
                            Text("\u{20B9}  25000",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w500,
                                  color: CommonColor.BLACK_COLOR
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              getFiltersCard(SizeConfig.screenHeight, SizeConfig.screenWidth),
            ],
          ),

        ],
      ),
    );
  }

  Widget getTopText(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.05, left: parentWidth*0.035, right: parentWidth*0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new,
                  color: CommonColor.WHITE_COLOR,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Statistics",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*5.5,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }

  Widget getFiltersCard(double parentHeight, double parentWidth){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.02,
           right: parentWidth*0.05),
          child: Container(
           decoration: BoxDecoration(
             color: CommonColor.SIGN_UP_TEXT_COLOR,
             borderRadius: BorderRadius.circular(20)
           ),
            child: Stack(
              children: [
                Visibility(
                  visible: hideFilterName,
                  child: Padding(
                    padding:  EdgeInsets.only(top: parentHeight*0.007, bottom: parentHeight*0.007,
                        left: parentWidth*0.05, right: parentWidth*0.02),
                    child: GestureDetector(
                      onTap: (){
                        showFilter = !showFilter;
                        hideFilterName = !hideFilterName;
                        if(mounted){
                          setState(() {

                          });
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.02),
                                  child: Text(selectFilter.isEmpty ? "All" : selectFilter,
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                              ],
                            ),


                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.01),
                              child: Icon(Icons.keyboard_arrow_down_sharp,
                                color: CommonColor.WHITE_COLOR,
                                size: parentHeight*0.025,),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Visibility(
                  visible: showFilter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.015, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "All";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                color: CommonColor.WHITE_COLOR,
                                size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("All",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.015, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "Today";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Today",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.007, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "Yesterday";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Yesterday",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.007, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "This Week";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("This Week",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.007, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "Last Week";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Last Week",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.007, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "This Month";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("This Month",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.007, bottom: parentHeight*0.007,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "Last Month";

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Last Month",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: parentHeight*0.007,
                            bottom: parentHeight*0.015,
                            left: parentWidth*0.02, right: parentWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            showFilter = !showFilter;
                            hideFilterName = !hideFilterName;
                            if(mounted){
                              setState(() {

                                selectFilter = "Custom Range";

                                showCupertinoDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return const AnimatedOpacity(
                                        opacity: 1.0,
                                        duration: Duration(seconds: 2),
                                        child: CustomRangeCalenderDialog());
                                  },
                                );

                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Icon(Icons.calendar_today_outlined,
                                  color: CommonColor.WHITE_COLOR,
                                  size: parentHeight*0.025,),

                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Custom Range",
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w500,
                                        color: CommonColor.WHITE_COLOR
                                    ),),
                                ),

                                // Icon(Icons.keyboard_arrow_down_sharp,
                                // color: Colors.white,
                                // size: parentHeight*0.025,)

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
