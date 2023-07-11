
import 'dart:async';

import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/my_post_more_info_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/data/model/get_all_transorter_post_response_model.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/booking_details_screen.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/interested_vehicle_owner_list.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/vehicle_owner_info_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String _printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}


class PendingPostScreen extends StatefulWidget {
  const PendingPostScreen({Key? key}) : super(key: key);

  @override
  State<PendingPostScreen> createState() => _PendingPostScreenState();
}

class _PendingPostScreenState extends State<PendingPostScreen> {



  bool vehicleDetailsHide = true;
  bool arrowShow = true;

  int? selectedIndex;
  int? selectedVehicleIndex;

  int index = 0;
  int vehicleIndex = -1;

  final items = <Doc>[];

  final companyName = <String>[];

  bool isLoading = false;

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

  String companyCustomer = "";

  double advancePay = 0.0;
  double duePay = 0.0;

  Timer? _timer;


  @override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        isLoading = true;
      });
    }

    refresh();

    /*ApiClient().getAllTransporterPost().then((value){

      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

      var jsonList = GetAllTransporterPostResponseModel.fromMap(value);

      print("jsonList --> $jsonList");

      items.addAll(jsonList.data?.docs as Iterable<Doc>);

      print("jsonList --> ${items.length}");

      for(int i = 0; i < items.length; i++){

        print(items[i].customer.toString());

        ApiClient().getUserDetailsApi(items[i].customer.toString()).then((value){
          if(mounted){
            setState(() {
              companyName = value['data']['companyName'];
              print("companyName $companyName");
            });
          }
        });

      }

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(mounted) {
          setState(
                () {},
          );
        }
      });

    });*/
  }

  refresh() async {

    final result = await ApiClient().getAllTransporterPost();

    final responseData = GetAllTransporterPostResponseModel.fromMap(result);

    items.addAll(responseData.data?.docs as Iterable<Doc>);

    await Future.forEach(responseData.data?.docs as Iterable<Doc>, (element) async {
      final customerData =
      await ApiClient().getUserDetailsApi(element.companyCustomer ?? '${element.customer}');
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
          CustomScrollView(
            slivers: <Widget>[

              SliverPadding(
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.1),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: items.length,
                          (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedIndex == index ? Colors.white : Colors.transparent,
                                boxShadow: <BoxShadow>[
                                  selectedIndex == index ? BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: const Offset(2, 6)) : const BoxShadow(color: Colors.transparent),
                                ],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                                      left: SizeConfig.screenWidth*0.03,
                                      right: SizeConfig.screenWidth*0.03),
                                  child: GestureDetector(
                                    onTap: (){
                                      if(index != selectedIndex){
                                        selectedIndex = index;

                                        index = selectedIndex!;

                                        print(selectedIndex);
                                        if(mounted) {
                                          setState(() {

                                          });
                                        }
                                      }else{
                                        selectedIndex = -1;
                                        if(mounted) {
                                          setState(() {

                                          });
                                        }
                                      }
                                    },
                                    onDoubleTap: (){
                                      if(selectedIndex == index){
                                        selectedIndex = -1;
                                        if(mounted){
                                          setState(() {

                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: selectedIndex != index ? Colors.white : Colors.transparent,
                                          boxShadow: <BoxShadow>[
                                            selectedIndex != index ? BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                blurRadius: 5,
                                                spreadRadius: 1,
                                                offset: const Offset(2, 6)) : const BoxShadow(color: Colors.transparent),
                                          ],
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth, index),
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: index == selectedIndex,
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.49,
                                    child: CustomScrollView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      slivers: [
                                        SliverList(
                                          delegate: SliverChildListDelegate(
                                            [
                                              getTransporterListHeading(SizeConfig.screenHeight, SizeConfig.screenWidth)
                                            ],
                                          ),
                                        ),

                                        SliverList(
                                            delegate: SliverChildBuilderDelegate(
                                              childCount: 3,
                                                  (context, index) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: SizeConfig.screenHeight*0.02,
                                                        left: SizeConfig.screenWidth*0.05,
                                                        right: SizeConfig.screenWidth*0.05,
                                                      ),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const VehicleOwnerInfoProfile()));
                                                        },
                                                        child: Container(
                                                          color: Colors.transparent,
                                                          child: Column(
                                                            children: [

                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [

                                                                  Text("Nikita Vehicle Owner",
                                                                    style: TextStyle(
                                                                        color: CommonColor.BLACK_COLOR,
                                                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                                        fontWeight: FontWeight.w500,
                                                                        fontFamily: 'Roboto_Regular'
                                                                    ),),

                                                                  RichText(
                                                                    text: TextSpan(
                                                                        text: '\u{20B9}',
                                                                        style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                                        ),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: ' 2000 / Vehicle',
                                                                              style: TextStyle(
                                                                                  fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                                                                  color: Colors.black,
                                                                                  fontWeight: FontWeight.w400))
                                                                        ]),
                                                                  ),

                                                                ],
                                                              ),

                                                              Padding(
                                                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Text("Pune",
                                                                      style: TextStyle(
                                                                          color: CommonColor.BLACK_COLOR,
                                                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontFamily: 'Roboto_Regular'
                                                                      ),),
                                                                  ],
                                                                ),
                                                              ),

                                                              Padding(
                                                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Text("Vehicle Available on : 1 Feb 23",
                                                                      style: TextStyle(
                                                                          color: CommonColor.BLACK_COLOR,
                                                                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontFamily: 'Roboto_Regular'
                                                                      ),),
                                                                  ],
                                                                ),
                                                              ),

                                                              Padding(
                                                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.002),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width: SizeConfig.screenWidth*0.11,
                                                                          height: SizeConfig.screenHeight*0.023,
                                                                          decoration: BoxDecoration(
                                                                            color: CommonColor.SELECT_TYPE_COLOR,
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [

                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                                                                child: Text("4.5",
                                                                                  style: TextStyle(
                                                                                      color: CommonColor.WHITE_COLOR,
                                                                                      fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontFamily: 'Roboto_Medium'
                                                                                  ),),
                                                                              ),

                                                                              Padding(
                                                                                padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.017),
                                                                                child: Icon(Icons.star,
                                                                                  size: SizeConfig.blockSizeHorizontal*2.5,
                                                                                  color: Colors.white,),
                                                                              )

                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                                                          child: Text(
                                                                            "No. of Vehicle : 04",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                                                                fontFamily: "Roboto_Regular",
                                                                                fontWeight: FontWeight.w400
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),



                                                                    GestureDetector(

                                                                      onTap: (){
                                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingDetailsScreen()));
                                                                      },
                                                                      child: Container(
                                                                        width: SizeConfig.screenWidth*0.18,
                                                                        height: SizeConfig.screenHeight*0.03,
                                                                        decoration: BoxDecoration(
                                                                          color: CommonColor.SIGN_UP_TEXT_COLOR,
                                                                          borderRadius: BorderRadius.circular(7),
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [

                                                                            Text("Book Now",
                                                                              style: TextStyle(
                                                                                  color: CommonColor.WHITE_COLOR,
                                                                                  fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontFamily: 'Roboto_Medium'
                                                                              ),),

                                                                          ],
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
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
                                                      child: Container(
                                                        height: SizeConfig.screenWidth*0.003,
                                                        color: Colors.black12,
                                                        child: const Row(
                                                          children: [
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
                                              },
                                            )
                                        ),


                                        SliverPadding(
                                          padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.15),
                                          sliver: SliverList(
                                            delegate: SliverChildListDelegate(
                                              [
                                                Padding(
                                                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,),
                                                  child: GestureDetector(

                                                    onTap: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const InterestedVehicleOwnerList()));
                                                    },
                                                    child: Container(
                                                      width: SizeConfig.screenWidth*0.21,
                                                      height: SizeConfig.screenHeight*0.05,
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [

                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.02),
                                                            child: Text("View All",
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    )
                ),
              ),


            ],
          ),
          Visibility(
            visible: isLoading,
              child: CircularProgressIndicator()
          ),
          Visibility(
            visible: items.isEmpty ? true : false,
            child: Text("My Post Not Available.",
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


  Widget getTransporterListHeading(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(
        top: parentHeight*0.025,
        left: parentWidth*0.05,
        right: parentWidth*0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("Interested Vehicle Owner List",
            style: TextStyle(
                color: CommonColor.BLACK_COLOR,
                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto_Medium'
            ),),

          /*GestureDetector(
            
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  elevation: 20,
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                  builder: (BuildContext bc) {
                    return VehicleOwnerListFilter();
                  });
            },
            child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Image(image: AssetImage("assets/images/filter_icon.png")),
                )
            ),
          )*/

        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth, int postIndex){

    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(items[postIndex].createdAt.toString());
    var inputDate = DateTime.parse(tempDate.toString());
    var outputFormat = DateFormat('dd MMMM yyyy');
    postOnDate = outputFormat.format(inputDate);

    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(items[postIndex].createdAt.toString());
    var inputTime = DateTime.parse(parseDate.toString());
    var inputFormat = DateFormat('hh:mm a');
    postOnTime = inputFormat.format(inputTime);

    DateTime pickDate = DateFormat("yyyy-MM-dd").parse("${items[postIndex].pickupDate}");
    var pickDates = DateTime.parse(pickDate.toString());
    var outputFormats = DateFormat('dd MMMM yyyy');
    pickUpDate = outputFormats.format(pickDates);

    DateTime pickTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse("${items[postIndex].pickupDate}");
    var pickTimes = DateTime.parse(pickTime.toString());
    var inputFormats = DateFormat('hh:mm a');
    pickUpTime = inputFormats.format(pickTimes);

    pickUpLocation = "${items[postIndex].pickup?.address?.street}, ${items[postIndex].pickup?.address?.city}, ${items[postIndex].pickup?.address?.district}, ${items[postIndex].pickup?.address?.laneNumber}, ${items[postIndex].pickup?.address?.state}, ${items[postIndex].pickup?.address?.country}, ${items[postIndex].pickup?.address?.postalCode}";

    finalLocation = "${items[postIndex].receiver?.address?.street}, ${items[postIndex].receiver?.address?.city}, ${items[postIndex].pickup?.address?.district}, ${items[postIndex].pickup?.address?.laneNumber}, ${items[postIndex].receiver?.address?.state}, ${items[postIndex].receiver?.address?.country}, ${items[postIndex].receiver?.address?.postalCode}";

    final endTime = DateTime.parse("${items[postIndex].postExpiryDate}");
    Duration remainingTime = endTime.difference(DateTime.now());

    final formattedTime = _printDuration(remainingTime);

    int? totalFare = items[postIndex].fare;
    double ratio = (items[postIndex].advancePayment!.ratio)! / 100;
    advancePay = (totalFare ?? 0) * ratio;

    int? totalFares = items[postIndex].fare;
    double ratios = (items[postIndex].deliveryPayment!.ratio)! / 100;
    duePay = (totalFares ?? 0) * ratios;


    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.012,),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(right: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Time Left  $formattedTime.",
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
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
                            width: parentWidth*0.5,
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
                            width: parentWidth*0.5,
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
                child: Column(
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
                                text: ' ${items[postIndex].fare}/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.001),
                      child: Row(
                        children: [
                          Text("(Transport Fare Per Vehicle)",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*2.0,
                                height: parentHeight*0.002
                            ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
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
                      padding: EdgeInsets.only(top: parentHeight*0.005),
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

                          DateTime tempDate = DateFormat("yyyy-MM-dd").parse("${items[postIndex].pickupDate}");
                          var inputDate = DateTime.parse(tempDate.toString());
                          var outputFormat = DateFormat('dd MMMM yyyy');
                          pickUpIndexDate = outputFormat.format(inputDate);

                          DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse("${items[postIndex].pickupDate}");
                          var inputTime = DateTime.parse(parseDate.toString());
                          var inputFormat = DateFormat('hh:mm a');
                          pickUpIndexTime = inputFormat.format(inputTime);


                          showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: Duration(seconds: 2),
                                  child: MyPostMoreInfoDialog(
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
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: parentHeight*0.01),
                          child: Text(
                            "No. of Vehicle : ${items[postIndex].vehicle?.quantity}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005,),
                          child: Row(
                            children: [

                              Padding(
                                padding: EdgeInsets.only(
                                    left: parentWidth*0.02),
                                child: Container(
                                  height: SizeConfig.screenWidth*0.05,
                                  width: parentWidth*0.003,
                                  color: Colors.black12,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: parentWidth*0.015),
                                child: Text(
                                  "Remaining  2",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.01),
                      child: Row(
                        children: [
                          Container(
                            width: parentWidth*0.65,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Adv. - ${advancePay}/- (${items[postIndex].advancePayment?.mode})",
                                  style: TextStyle(
                                    color: CommonColor.FROM_AREA_COLOR,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                  ),),
                                Padding(
                                  padding: EdgeInsets.only(left: parentWidth*0.017),
                                  child: Text("Due. - $duePay/- (${items[postIndex].deliveryPayment?.mode})",
                                    style: TextStyle(
                                      color: CommonColor.TO_AREA_COLOR,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                    ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
                              child: CompanyVerifyDialog(companyId: items[postIndex].customer.toString(), postStatus: items[postIndex].status.toString(),),
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
                              child: Text(companyName[postIndex],
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
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
                right: parentWidth*0.05,
                top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(index != vehicleIndex){
                      vehicleIndex = index;

                      index = vehicleIndex!;

                      print(vehicleIndex);
                      if(mounted) {
                        setState(() {

                        });
                      }
                    }else{
                      vehicleIndex = -1;
                      if(mounted) {
                        setState(() {

                        });
                      }
                    }


                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Text("Vehicle Details",
                          style: TextStyle(
                              color: CommonColor.BLACK_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),
                        Stack(
                          children: [
                            Visibility(
                              visible: index != vehicleIndex,
                              child: const Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            ),
                            Visibility(
                              visible: index == vehicleIndex,
                              child: const Icon(Icons.keyboard_arrow_up_outlined,
                                color: Colors.black,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          for(int i = 0; i < 3; i++)

            Visibility(
              visible: /*!vehicleDetailsHide*/ index == vehicleIndex,
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05,
                    right: parentWidth*0.05,
                    top: parentHeight*0.01),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.02,
                            top: parentHeight*0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Column(
                              children: [
                                Container(
                                  height: parentHeight*0.085,
                                  width: parentWidth*0.2,
                                  decoration: BoxDecoration(
                                      color: CommonColor.VEHICLE_DRIVER_IMG_COLOR,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                Text("MH12 NT3456",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium',
                                      height: parentHeight*0.002
                                  ),),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: parentWidth*0.54,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          width: parentWidth*0.35,
                                          child: Text("Raj Vehicle",
                                            style: TextStyle(
                                                color: CommonColor.BLACK_COLOR,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto_Medium'
                                            ),),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            Padding(
                                              padding: EdgeInsets.only(right: parentWidth*0.02),
                                              child: Text("Rs. 2000",
                                                style: TextStyle(
                                                    color: CommonColor.BLACK_COLOR,
                                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Roboto_Medium'
                                                ),),
                                            ),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.005),
                                    child: Text("Type Of Vehicle",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.005),
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Pack Body',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                          children: [
                                            TextSpan(
                                                text: '  (LxW: 40x08 ft)',
                                                style: TextStyle(
                                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Roboto_Regular'))
                                          ]),
                                    ),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.01),
                                    child: Container(
                                      color: Colors.transparent,
                                      width: parentWidth*0.53,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "Mobile No.",
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
                                                      "8965247632",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig.blockSizeHorizontal*3.1,
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
                                                    "RLW Kgs",
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
                                                      "1550Kg",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig.blockSizeHorizontal*3.1,
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
                                                    "Driver Assign",
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
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: parentWidth*0.17,
                                                      child: Center(
                                                        child: Text(
                                                          "Vinay",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.1,
                                                              fontFamily: "Roboto_Regular",
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.01),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Adv. - 1000/- (Online)",
                                                style: TextStyle(
                                                  color: CommonColor.FROM_AREA_COLOR,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                                ),),
                                              Padding(
                                                padding: EdgeInsets.only(left: parentWidth*0.03),
                                                child: Text("Due. - 1000/- ",
                                                  style: TextStyle(
                                                    color: CommonColor.TO_AREA_COLOR,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                                  ),),
                                              ),
                                            ],
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

                      SizedBox(
                        height: parentHeight*0.01,
                      )

                    ],
                  ),
                ),
              ),
            ),

          SizedBox(
            height: parentHeight*0.02,
          )

        ],
      ),
    );
  }
}


