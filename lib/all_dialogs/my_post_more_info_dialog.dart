
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/data/api_constant/api_url.dart';
import 'package:fixgotransporterapp/data/model/get_all_transorter_post_response_model.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';




const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = CommonColor.SIGN_UP_TEXT_COLOR;
const todoColor = Color(0xffd1d2d7);


// setState(() {
// _processIndex = (_processIndex + 1) % _processes.length;
// });


class MyPostMoreInfoDialog extends StatefulWidget {

  final String isComeFrom;
  final List <Doc>postDetails;
  final int postIndex;
  final String pickupDate;
  final String pickupTime;
  final String pickupLocation;
  final String finalLocation;

  const MyPostMoreInfoDialog({Key? key, required this.postDetails, required this.postIndex, this.pickupDate = '', this.pickupTime ='', this.pickupLocation = '', this.finalLocation = '', this.isComeFrom = ""}) : super(key: key);

  @override
  State<MyPostMoreInfoDialog> createState() => _MyPostMoreInfoDialogState();
}

class _MyPostMoreInfoDialogState extends State<MyPostMoreInfoDialog> {


  final _processes = [
    'Order Confirm',
    'Pick-up',
    'Transit',
    'Delivered',
  ];

  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  double advancePay = 0.0;
  double deliveryPay = 0.0;

  @override
  void initState() {
    super.initState();

    print(widget.postDetails);


    int totalFare = widget.postDetails[widget.postIndex].fare ?? 0;
    double ratio = (widget.postDetails[widget.postIndex].advancePayment?.ratio ?? 0) / 100;
    advancePay = totalFare * ratio;

    int totalsFare = widget.postDetails[widget.postIndex].fare ?? 0;
    double ratios = (widget.postDetails[widget.postIndex].deliveryPayment?.ratio ?? 0) / 100;
    deliveryPay = totalsFare * ratios;

    if(widget.postDetails[widget.postIndex].status == "PENDING"){
      setState(() {
        _processIndex = 0;
      });
    }else if(widget.postDetails[widget.postIndex].status == "ACCEPTED"){
      setState(() {
        _processIndex = (_processIndex + 1) % _processes.length ;
      });
    }else if(widget.postDetails[widget.postIndex].status == "IN_TRANSIT"){
      setState(() {
        _processIndex = (_processIndex + 2) % _processes.length ;
      });
    }else if(widget.postDetails[widget.postIndex].status == "COMPLETED"){
      setState(() {
        _processIndex = (_processIndex + 3) % _processes.length ;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * .01,
            right: SizeConfig.screenWidth * .01,
            top: SizeConfig.screenHeight*0.02),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child:  Container(
              height: widget.isComeFrom == "1" ? SizeConfig.screenHeight*0.84 :SizeConfig.screenHeight*0.9,
              decoration:  const BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(25.0)),
                //color: CommonColor.RED_COLOR,
              ),
              child:  ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [

                  Container(
                    height: SizeConfig.screenHeight*0.05,
                    decoration: const BoxDecoration(
                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                          child: const Icon(Icons.clear,
                            color: Colors.transparent,),
                        ),
                        Text("More Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto_Medium',
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5
                          ),),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.05),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Icon(Icons.clear,
                                color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: SizeConfig.screenHeight*0.13,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Expanded(
                          child: Timeline.tileBuilder(
                            physics: const NeverScrollableScrollPhysics(),
                            theme: TimelineThemeData(
                              direction: Axis.horizontal,
                              connectorTheme: const ConnectorThemeData(
                                space: 20.0,
                                thickness: 3.0,
                              ),
                            ),
                            builder: TimelineTileBuilder.connected(
                              contentsAlign: ContentsAlign.reverse,
                              connectionDirection: ConnectionDirection.before,
                              itemExtentBuilder: (_, __) =>
                              MediaQuery.of(context).size.width / _processes.length,
                              oppositeContentsBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                  child: Container(
                                    width: SizeConfig.screenWidth*0.125,
                                    color: Colors.transparent,
                                    child: Text("2:00 PM 28 Jan 23",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black26,
                                          height: SizeConfig.screenHeight*0.0017,
                                          fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                          fontFamily: 'Roboto_Regular'
                                      ),
                                      textAlign: TextAlign.center,),
                                  ),
                                );
                              },
                              indicatorBuilder: (_, index) {
                                Color color;
                                var child;
                                if (index == _processIndex) {
                                  color = inProgressColor;
                                  child = const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3.0,
                                      valueColor: AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  );
                                } else if (index < _processIndex) {
                                  color = completeColor;
                                  child = const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15.0,
                                  );
                                } else {
                                  color = todoColor;
                                }

                                if (index <= _processIndex) {
                                  return DotIndicator(
                                    size: 30.0,
                                    color: color,
                                    child: child,
                                  );
                                } else {
                                  return OutlinedDotIndicator(
                                    borderWidth: 4.0,
                                    color: color,
                                  );
                                }
                              },
                              connectorBuilder: (_, index, type) {
                                if (index > 0) {
                                  if (index == _processIndex) {
                                    final prevColor = getColor(index - 1);
                                    final color = getColor(index);
                                    List<Color> gradientColors;
                                    if (type == ConnectorType.start) {
                                      gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                                    } else {
                                      gradientColors = [
                                        prevColor,
                                        Color.lerp(prevColor, color, 0.5)!
                                      ];
                                    }
                                    return DecoratedLineConnector(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: gradientColors,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return SolidLineConnector(
                                      color: getColor(index),
                                    );
                                  }
                                } else {
                                  return null;
                                }
                              },
                              contentsBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.01,),
                                  child: Text(
                                    _processes[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: getColor(index),
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0
                                    ),
                                  ),
                                );
                              },
                              itemCount: _processes.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  getInfoLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)



                ],
              )
          ),
        ),
      ),
    );
  }

  Widget getInfoLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.02),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.051),
            child: Row(
              children: [
                Container(
                  height: parentHeight*0.01,
                  width: parentWidth*0.021,
                  decoration: BoxDecoration(
                      color: CommonColor.FROM_AREA_COLOR,
                      shape: BoxShape.circle
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.02),
                  child: Container(
                    width: parentWidth*0.57,
                    color: Colors.transparent,
                    child: Text(
                      widget.pickupLocation,
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.061),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: parentHeight*0.013,
                  width: parentWidth*0.003,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.052, top: parentHeight*0.00),
            child: Row(
              children: [

                Container(
                  height: parentHeight*0.010,
                  width: parentWidth*0.021,
                  decoration: BoxDecoration(
                      color: CommonColor.TO_AREA_COLOR,
                      shape: BoxShape.circle
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.02),
                  child: Container(
                    width: parentWidth*0.6,
                    color: Colors.transparent,
                    child: Text(
                      widget.finalLocation,
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Type Of Load",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Qty. of Goods/Load",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${widget.postDetails[widget.postIndex].loadDetail?.loadType}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${widget.postDetails[widget.postIndex].loadDetail?.load} ${widget.postDetails[widget.postIndex].loadDetail?.loadUnit}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Description",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.007, right: parentWidth*0.05,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                  width: parentWidth*0.85,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${widget.postDetails[widget.postIndex].loadDetail?.description}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Pickup Date",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Pick-up Time",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(widget.pickupDate,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(widget.pickupTime,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Type of Vehicle",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Carrying Capacity",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Text("${widget.postDetails[widget.postIndex].vehicle?.vehicleType}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal*3.2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Regular'
                      ),
                    ),
                    Visibility(
                      visible: widget.postDetails[widget.postIndex].vehicle?.vehicleType == "Trailor" ? true : false,
                      child: Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.01),
                        child: Text("(${widget.postDetails[widget.postIndex].vehicle?.trailorType})",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${widget.postDetails[widget.postIndex].vehicle?.capacity} ${widget.postDetails[widget.postIndex].vehicle?.capacityUnit}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("No. of Vehicle",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("ODC",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${widget.postDetails[widget.postIndex].vehicle?.quantity}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("L - ${widget.postDetails[widget.postIndex].vehicle?.length} (Ft) ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Total Fare",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                RichText(
                  text: TextSpan(
                      text: '\u{20B9}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),
                      children: [
                        TextSpan(
                            text: ' ${widget.postDetails[widget.postIndex].fare}/-',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400))
                      ]),
                ),

              ],
            ),
          ),

          Visibility(
            visible: widget.isComeFrom == "1" ? false : true,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                      left: parentWidth*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Adv. Payment",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),
                      ),

                      Container(
                        width: parentWidth*0.4,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Delivery Payment",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto_Regular'
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                      left: parentWidth*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      RichText(
                        text: TextSpan(
                            text: '\u{20B9}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            ),
                            children: [
                              TextSpan(
                                  text: ' ${advancePay.toStringAsFixed(1)}/-',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: ' ${widget.postDetails[widget.postIndex].advancePayment?.payBy} (${widget.postDetails[widget.postIndex].advancePayment?.mode})',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ),

                      Container(
                        width: parentWidth*0.4,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                    text: '\u{20B9}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: ' ${deliveryPay.toStringAsFixed(1)}/-',
                                          style: TextStyle(
                                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: ' ${widget.postDetails[widget.postIndex].deliveryPayment?.payBy} (${widget.postDetails[widget.postIndex].deliveryPayment?.mode})',
                                          style: TextStyle(
                                              fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),



          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02,
                left: parentWidth*0.05,
                right: parentWidth*0.17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: SizeConfig.screenWidth*0.3,
                  height: SizeConfig.screenHeight*0.04,
                  decoration: BoxDecoration(
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Load",
                        style: TextStyle(
                            color: CommonColor.WHITE_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),

                    ],
                  ),
                ),
                /* Container(
                  width: SizeConfig.screenWidth*0.3,
                  height: SizeConfig.screenHeight*0.04,
                  decoration: BoxDecoration(
                    color: CommonColor.LOAD_SUBMIT_COLOR,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Vehicle",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),

                    ],
                  ),
                ),
*/              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02,
                left: parentWidth*0.1,
                right: parentWidth*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                for(int i = 0; i < (widget.postDetails[widget.postIndex].loadDetail?.goodsImage?.length ?? 0); i++)
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.03),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: const AssetImage("assets/images/grid_loading.gif"),
                          height: SizeConfig.screenHeight*.05,
                          width: SizeConfig.screenWidth*.05,
                        ),
                        Container(
                          height: parentHeight*0.074,
                          width: parentWidth*0.172,
                          decoration: BoxDecoration(
                            // color: CommonColor.LOAD_IMAGE_COLOR,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 7,
                                  spreadRadius: 3,
                                  offset: const Offset(2, 2.0))
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("${ApiConstants().uploadImageUrl}${widget.postDetails[widget.postIndex].loadDetail?.goodsImage?[i]}",
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                  )


              ],
            ),
          ),


        ],
      ),
    );
  }
}
