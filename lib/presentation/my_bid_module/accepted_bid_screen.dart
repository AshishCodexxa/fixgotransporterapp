import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/more_info_bid_load_post.dart';
import 'package:fixgotransporterapp/all_dialogs/post_load_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/data/model/get_all_bid_status_list_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class AcceptedBidScreen extends StatefulWidget {
  const AcceptedBidScreen({Key? key}) : super(key: key);

  @override
  State<AcceptedBidScreen> createState() => _AcceptedBidScreenState();
}

class _AcceptedBidScreenState extends State<AcceptedBidScreen> {


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

  final companyName = <String>[];

  bool isLoading = false;

  double advancePay = 0.0;
  double duePay = 0.0;


  @override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        isLoading = true;
      });
    }

    refresh();
  }

  refresh() async {

    final result = await ApiClient().getMyBidAcceptedStatusPost();

    final responseData = GetMyBidPostResponseModel.fromMap(result);

    items.addAll(responseData.data);

    await Future.forEach(responseData.data, (element) async {
      final customerData =
      await ApiClient().getUserDetailsApi(element.post!.customer.toString());
      companyName.add(customerData['data']['companyName']);
    });

    if(mounted){
      setState(() {
        isLoading = false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03),
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
                    child: getInfoCardLayout(
                        SizeConfig.screenHeight, SizeConfig.screenWidth, index),
                  ),
                );
              }
          ),
          Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator()
          ),
          Visibility(
            visible: items.isEmpty ? true : false,
            child: const Text("Bid Accepting Post Not Available.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto_Medium"
              ),),
          )
        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth, postIndex) {


    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(items[postIndex].createdAt.toString());
    var inputDate = DateTime.parse(tempDate.toString());
    var outputFormat = DateFormat('dd MMMM yyyy');
    postOnDate = outputFormat.format(inputDate);

    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(items[postIndex].createdAt.toString());
    var inputTime = DateTime.parse(parseDate.toString());
    var inputFormat = DateFormat('hh:mm a');
    postOnTime = inputFormat.format(inputTime);

    DateTime pickDate = DateFormat("yyyy-MM-dd").parse("${items[postIndex].post?.pickupDate}");
    var pickDates = DateTime.parse(pickDate.toString());
    var outputFormats = DateFormat('dd MMMM yyyy');
    pickUpDate = outputFormats.format(pickDates);

    DateTime pickTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse("${items[postIndex].post?.pickupDate}");
    var pickTimes = DateTime.parse(pickTime.toString());
    var inputFormats = DateFormat('hh:mm a');
    pickUpTime = inputFormats.format(pickTimes);

    pickUpLocation = "${items[postIndex].post?.pickup?.address?.street}, ${items[postIndex].post?.pickup?.address?.city}, ${items[postIndex].post?.pickup?.address?.district}, ${items[postIndex].post?.pickup?.address?.laneNumber}, ${items[postIndex].post?.pickup?.address?.state}, ${items[postIndex].post?.pickup?.address?.country}, ${items[postIndex].post?.pickup?.address?.postalCode}";

    finalLocation = "${items[postIndex].post?.receiver?.address?.street}, ${items[postIndex].post?.receiver?.address?.city}, ${items[postIndex].post?.pickup?.address?.district}, ${items[postIndex].post?.pickup?.address?.laneNumber}, ${items[postIndex].post?.receiver?.address?.state}, ${items[postIndex].post?.receiver?.address?.country}, ${items[postIndex].post?.receiver?.address?.postalCode}";

    int? totalFare = items[postIndex].post?.fare;
    double ratio = (items[postIndex].post?.advancePayment!.ratio)! / 100;
    advancePay = (totalFare ?? 0) * ratio;

    int? totalFares = items[postIndex].post?.fare;
    double ratios = (items[postIndex].post?.deliveryPayment!.ratio)! / 100;
    duePay = (totalFares ?? 0) * ratios;


    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: parentWidth * 0.05,
                  top: parentHeight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Container(
                        height: parentHeight * 0.01,
                        width: parentWidth * 0.021,
                        decoration: const BoxDecoration(
                            color: CommonColor.FROM_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.02),
                        child: Container(
                          width: parentWidth * 0.55,
                          color: Colors.transparent,
                          child: Text(
                            pickUpLocation,
                            style: TextStyle(
                                color: CommonColor.BLACK_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.0,
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
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight * 0.013,
                          width: parentWidth * 0.003,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [

                      Container(
                        height: parentHeight * 0.01,
                        width: parentWidth * 0.021,
                        decoration: const BoxDecoration(
                            color: CommonColor.TO_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth * 0.02),
                        child: Container(
                          width: parentWidth * 0.55,
                          color: Colors.transparent,
                          child: Text(
                            finalLocation,
                            style: TextStyle(
                                color: CommonColor.BLACK_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.0,
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
              padding: EdgeInsets.only(right: parentWidth * 0.05,),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: '\u{20B9}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                        ),
                        children: [
                          TextSpan(
                              text: ' ${items[postIndex].post?.lowestBid}/-',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal *
                                      4.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: parentWidth * 0.05, top: parentHeight * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Post on $postOnDate | $postOnTime",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                        fontFamily: "Roboto_Regular",
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: parentWidth * 0.05,
                  top: parentHeight * 0.01),
              child: Container(
                width: parentWidth * 0.17,
                height: parentHeight * 0.023,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: CommonColor.BOOKING_CONFIRM_COLOR),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Order Confirm",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 2.3,
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
          padding: EdgeInsets.only(
              left: parentWidth * 0.05, top: parentHeight * 0.005),
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
                            fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.007),
                    child: Row(
                      children: [
                        Text(
                          pickUpDate,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
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
                            fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.007,
                        left: parentWidth * 0.03),
                    child: GestureDetector(
                      onTap: () {

                        passPickIndexAddress = "${items[postIndex].post?.pickup?.address?.street}, ${items[postIndex].post?.pickup?.address?.city}, ${items[postIndex].post?.pickup?.address?.district}, ${items[postIndex].post?.pickup?.address?.laneNumber} ${items[postIndex].post?.pickup?.address?.state}, ${items[postIndex].post?.pickup?.address?.country}, ${items[postIndex].post?.pickup?.address?.postalCode}";

                        passLastIndexAddress = "${items[postIndex].post?.receiver?.address?.street}, ${items[postIndex].post?.receiver?.address?.city}, ${items[postIndex].post?.receiver?.address?.state}, ${items[postIndex].post?.receiver?.address?.country}, ${items[postIndex].post?.receiver?.address?.postalCode}";

                        DateTime tempDate = DateFormat("yyyy-MM-dd").parse("${items[postIndex].post?.pickupDate}");
                        var inputDate = DateTime.parse(tempDate.toString());
                        var outputFormat = DateFormat('dd MMMM yyyy');
                        pickUpIndexDate = outputFormat.format(inputDate);

                        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse("${items[postIndex].post?.pickupDate}");
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
                                child: LoadMoreBidPostInfoDialog(
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
                              fontSize: SizeConfig.blockSizeHorizontal * 3.7,
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
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.015,
              left: parentWidth * 0.012),
          child: CustomPaint(painter: DrawDottedhorizontalline()),
        ),

        Padding(
          padding: EdgeInsets.only(left: parentWidth * 0.05,
              top: parentHeight * 0.01),
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
                              fontSize: SizeConfig.blockSizeHorizontal * 3.2,
                            ),
                            children: [
                              TextSpan(
                                  text: '${items[postIndex].post?.loadDetail?.load} ${items[postIndex].post?.loadDetail?.loadUnit}',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal *
                                          3.7,
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
                padding: EdgeInsets.only(right: parentWidth * 0.05,),
                child: GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
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
                            child: CompanyVerifyDialog(companyId: items[postIndex].post!.customer.toString(), postStatus: items[postIndex].post!.status.toString()),
                          );
                        });
                  },
                  child: Container(
                    height: parentHeight * 0.025,
                    width: parentWidth * 0.16,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26,)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: parentWidth * 0.01,
                          right: parentWidth * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: parentWidth*0.1,
                            child: Text(companyName[postIndex],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Medium',
                                fontSize: SizeConfig.blockSizeHorizontal * 2.7,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: parentHeight * 0.0,
              left: parentWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: parentWidth * 0.65,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Adv. - $advancePay/- (${items[postIndex].post?.advancePayment?.mode})",
                      style: TextStyle(
                        color: CommonColor.FROM_AREA_COLOR,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal *
                            2.5,
                      ),),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.02),
                      child: Text("Due. - $duePay/- (${items[postIndex].post?.deliveryPayment?.mode})",
                        style: TextStyle(
                          color: CommonColor.TO_AREA_COLOR,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal *
                              2.5,
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01,
                    right: parentWidth * 0.05),
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
                            child: const PostLoadDialog(),
                          );
                        });
                  },
                  child: Container(
                    width: SizeConfig.screenWidth*0.18,
                    height: SizeConfig.screenHeight*0.028,
                    decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Post Load",
                          style: TextStyle(
                              color: CommonColor.WHITE_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal*2.7,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),



        SizedBox(
          height: parentHeight * 0.01,
        )

      ],
    );
  }

}
