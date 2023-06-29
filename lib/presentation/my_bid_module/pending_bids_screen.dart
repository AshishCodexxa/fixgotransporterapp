import 'package:fixgotransporterapp/all_dialogs/bid_now_price_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/data/model/get_all_company_post_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class PendingBidScreen extends StatefulWidget {
  const PendingBidScreen({Key? key}) : super(key: key);

  @override
  State<PendingBidScreen> createState() => _PendingBidScreenState();
}

class _PendingBidScreenState extends State<PendingBidScreen> {

  final items = <Datum>[];

  String postOnDate = "";
  String postOnTime = "";

  String pickUpDate = "";
  String pickUpTime = "";

  String pickUpLocation = "";
  String finalLocation = "";

  String passPickIndexAddress = "";
  String passLastIndexAddress = "";
  String pickUpIndexDate = "";
  String pickUpIndexTime = "";

  String companyName = "";



  @override
  void initState() {
    super.initState();
    ApiClient().getCompanyAllPost().then((value){

      if(mounted){
        setState(() {

        });
      }

      var jsonList = GetAllCompanyPostResponseModel.fromJson(value);

      print(jsonList);

      items.addAll(jsonList.data);

      for(int i = 0; i < items.length; i++){

          ApiClient().getUserDetailsApi(items[i].customer.toString()).then((value){

            if(mounted){
              setState(() {
                companyName = value['data']['companyName'];
              });
            }


          });

      }

      print(items.length);

    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                  left: SizeConfig.screenWidth*0.03,
                  right: SizeConfig.screenWidth*0.03),
              child: Container(
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
                child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth, index),
              ),
            );
          }
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth, postIndex){

    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(items[postIndex].createdAt.toString());
    var inputDate = DateTime.parse(tempDate.toString());
    var outputFormat = DateFormat('dd MMMM yyyy');
    postOnDate = outputFormat.format(inputDate);

    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(items[postIndex].createdAt.toString());
    var inputTime = DateTime.parse(parseDate.toString());
    var inputFormat = DateFormat('hh:mm a');
    postOnTime = inputFormat.format(inputTime);

    DateTime pickDate = DateFormat("yyyy-MM-dd").parse(items[postIndex].pickupDate.toString());
    var pickDates = DateTime.parse(pickDate.toString());
    var outputFormats = DateFormat('dd MMMM yyyy');
    pickUpDate = outputFormats.format(pickDates);

    DateTime pickTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(items[postIndex].pickupDate.toString());
    var pickTimes = DateTime.parse(pickTime.toString());
    var inputFormats = DateFormat('hh:mm a');
    pickUpTime = inputFormats.format(pickTimes);

    pickUpLocation = "${items[postIndex].pickup?.address?.street}, ${items[postIndex].pickup?.address?.city}, ${items[postIndex].pickup?.address?.district}, ${items[postIndex].pickup?.address?.laneNumber}, ${items[postIndex].pickup?.address?.state}, ${items[postIndex].pickup?.address?.country}, ${items[postIndex].pickup?.address?.postalCode}";

    finalLocation = "${items[postIndex].receiver?.address?.street}, ${items[postIndex].receiver?.address?.city}, ${items[postIndex].pickup?.address?.district}, ${items[postIndex].pickup?.address?.laneNumber}, ${items[postIndex].receiver?.address?.state}, ${items[postIndex].receiver?.address?.country}, ${items[postIndex].receiver?.address?.postalCode}";


    return Column(
      children: [

        Container(
          height: parentHeight*0.04,
          decoration: const BoxDecoration(
            color: CommonColor.LOWEST_BID_CONTAINER_COLOR,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      "Lowest Bid ${items[postIndex].lowestBid}/-",
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    Container(
                      color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: parentWidth*0.01),
                                child: Icon(Icons.person,
                                size: parentHeight*0.03,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: parentHeight*0.01),
                                child: Container(
                                  height: parentHeight*0.017,
                                  width: parentWidth*0.037,
                                  decoration: const BoxDecoration(
                                    color: CommonColor.SAME_BID_COUNT_COLOR,
                                    shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${items[postIndex].lowestBidder}",
                                      style: TextStyle(
                                          color: CommonColor.WHITE_COLOR,
                                          fontSize: SizeConfig.blockSizeHorizontal*2.0,
                                          fontFamily: "Roboto_Medium",
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    )

                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Time Left  23:59:59 hrs.",
                        style: TextStyle(
                            color: CommonColor.TO_AREA_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*2.5,
                            fontFamily: "Roboto_Medium",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05,
              top: parentHeight*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Container(
                        height: parentHeight*0.01,
                        width: parentWidth*0.021,
                        decoration: const BoxDecoration(
                            color: CommonColor.FROM_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                        child: Container(
                          width: parentWidth*0.55,
                          color: Colors.transparent,
                          child: Text(
                            pickUpLocation,
                            style: TextStyle(
                                color: CommonColor.BLACK_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontFamily: "Roboto_Medium",
                                fontWeight: FontWeight.w400
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight*0.013,
                          width: parentWidth*0.003,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [

                      Container(
                        height: parentHeight*0.01,
                        width: parentWidth*0.021,
                        decoration: const BoxDecoration(
                            color: CommonColor.TO_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.02),
                        child: Container(
                          width: parentWidth*0.55,
                          color: Colors.transparent,
                          child: Text(
                            finalLocation,
                            style: TextStyle(
                                color: CommonColor.BLACK_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontFamily: "Roboto_Medium",
                                fontWeight: FontWeight.w400
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: parentWidth*0.05,),
              child: GestureDetector(
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
                          child: BidNowPriceDialog(
                            isComeFrom: '2',
                            mainPrice: (items[postIndex].lowestBid == 0 ? items[postIndex].fare : items[postIndex].lowestBid) ?? 0,
                            bidAmount: items[postIndex].lowestBid ?? 0,
                            postDetails: items, postIndex: postIndex, companyName: companyName,
                          ),
                        );
                      });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: '\u{20B9}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                            ),
                            children: [
                              TextSpan(
                                  text: ' ${items[postIndex].lowestBid}/-',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Icon(Icons.edit,
                        color: Colors.black,
                        size: parentHeight*0.02,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Post on $postOnDate | $postOnTime",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: parentWidth*0.05,
                  top: parentHeight*0.01),
              child: Container(
                width: parentWidth*0.2,
                height: parentHeight*0.023,
                decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.BOOKING_CONFIRM_COLOR),
                    borderRadius: BorderRadius.circular(20)
                ),
                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Bidding in Process",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*2.0,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w500,
                          color: CommonColor.BOOKING_CONFIRM_COLOR
                      ),),
                  ),
                ),
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text(
                        "Pick-up Date",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.007),
                    child: Row(
                      children: [
                        Text(
                          pickUpDate,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text(
                        "Pick-up Time",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.007),
                    child: Row(
                      children: [
                        Text(
                          pickUpTime,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text(
                        "Bid End Date",
                        style: TextStyle(
                            color: Colors.transparent,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.007,
                        left: parentWidth*0.03),
                    child:GestureDetector(
                    onTap: (){

                      passPickIndexAddress = "${items[postIndex].pickup?.address?.street}, ${items[postIndex].pickup?.address?.city}, ${items[postIndex].pickup?.address?.district}, ${items[postIndex].pickup?.address?.laneNumber} ${items[postIndex].pickup?.address?.state}, ${items[postIndex].pickup?.address?.country}, ${items[postIndex].pickup?.address?.postalCode}";

                      passLastIndexAddress = "${items[postIndex].receiver?.address?.street}, ${items[postIndex].receiver?.address?.city}, ${items[postIndex].receiver?.address?.state}, ${items[postIndex].receiver?.address?.country}, ${items[postIndex].receiver?.address?.postalCode}";

                      DateTime tempDate = DateFormat("yyyy-MM-dd").parse(items[postIndex].pickupDate.toString());
                      var inputDate = DateTime.parse(tempDate.toString());
                      var outputFormat = DateFormat('dd MMMM yyyy');
                      pickUpIndexDate = outputFormat.format(inputDate);

                      DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(items[postIndex].pickupDate.toString());
                      var inputTime = DateTime.parse(parseDate.toString());
                      var inputFormat = DateFormat('hh:mm a');
                      pickUpIndexTime = inputFormat.format(inputTime);

                      showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return AnimatedOpacity(
                                opacity: 1.0,
                                duration: const Duration(seconds: 2),
                                child: LoadMoreInfoDialog(
                                  isComeFrom: '',
                                  postDetails: items,
                                  postIndex: postIndex,
                                  pickupDate: pickUpIndexDate,
                                  pickupTime: pickUpIndexTime,
                                  pickupLocation: passPickIndexAddress,
                                  finalLocation: passLastIndexAddress,
                                ));
                          },
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessTimelinePage()));
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "More",
                          style: TextStyle(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                              fontFamily: "Roboto_Regular ",
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              )

            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015,
              left: parentWidth*0.012),
          child: CustomPaint(painter: DrawDottedhorizontalline()),
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.05,
              top: parentHeight*0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Qty Of Load : ',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                            ),
                            children: [
                              TextSpan(
                                  text: '${items[postIndex].loadDetail?.load} ${items[postIndex].loadDetail?.loadUnit}',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto_Regular'))
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: parentWidth*0.05,),
                child: GestureDetector(
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
                            child: CompanyVerifyDialog(companyId: items[postIndex].pickup!.customer.toString(),),
                          );
                        });
                  },
                  child: Container(
                    height: parentHeight*0.025,
                    width: parentWidth*0.16,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26,)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.01,
                          right: parentWidth*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: parentWidth*0.1,
                            child: Text(companyName,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Medium',
                                fontSize: SizeConfig.blockSizeHorizontal*2.7,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: parentHeight*0.01,
        )

      ],
    );
  }
}
