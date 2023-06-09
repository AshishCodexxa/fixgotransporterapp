import 'dart:async';

import 'package:fixgotransporterapp/all_dialogs/bid_now_price_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/dashboard/dashboard_screen.dart';
import 'package:fixgotransporterapp/data/data_constant/constant_data.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/data/model/get_all_company_post_response_model.dart';
import 'package:fixgotransporterapp/presentation/home_module/create_new_load_form_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';

String _printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

class HomeChildScreen extends StatefulWidget {
  final HomeChildScreenListener mListener;

  const HomeChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<HomeChildScreen> createState() => _HomeChildScreenState();
}

class _HomeChildScreenState extends State<HomeChildScreen> {
  static const kGoogleApiKey = "AIzaSyDmKx2C1OIAxNzTeoxEH1U8getJT3hTQF4";

  String pickLocation = "";
  String dilveryLocation = "";

  int locationType = 0;
  int filterType = 0;

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

  String companiesName = "";

  final companyName = <String>[];

  bool isLoading = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    companiesName = GetStorage().read(ConstantData.companyName) ?? "";

    print(companyName);

    filterType = 0;

    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    refresh();
  }

  refresh() async {
    /*ApiClient().getCompanyAllPost().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      var jsonList = GetAllCompanyPostResponseModel.fromJson(value);

      print(jsonList);

      items.addAll(jsonList.data);

      for (int i = 0; i < items.length; i++) {
        ApiClient()
            .getUserDetailsApi(items[i].customer.toString())
            .then((value) {
          if (mounted) {
            setState(() {
              companyName.add(value['data']['companyName']);
            });
          }
        });
      }

      print("companyName $companyName");

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(
            () {},
          );
        }
      });
    });*/

    final result = await ApiClient().getCompanyAllPost();

    final responseData = GetAllCompanyPostResponseModel.fromJson(result);

    items.addAll(responseData.data);

    await Future.forEach(responseData.data, (element) async {
      final customerData =
          await ApiClient().getUserDetailsApi(element.customer.toString());
      companyName.add(customerData['data']['companyName']);
    });

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(mounted) {
        setState(
              () {},
        );
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        getAdvContainer(
                            SizeConfig.screenHeight, SizeConfig.screenWidth)
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        getPickUpAndDeliverLocation(
                            SizeConfig.screenHeight, SizeConfig.screenWidth),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: SizeConfig.screenHeight*0.04,
                                width: SizeConfig.screenWidth*0.2,
                                decoration: BoxDecoration(
                                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                  child: Text("Search",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Normal'
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        getFindingLoadFilter(
                            SizeConfig.screenHeight, SizeConfig.screenWidth)
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
                    sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                      childCount: items.length,
                      (context, index) {
                        DateTime tempDate = DateFormat("yyyy-MM-dd")
                            .parse(items[index].createdAt.toString());
                        var inputDate = DateTime.parse(tempDate.toString());
                        var outputFormat = DateFormat('dd MMMM yyyy');
                        postOnDate = outputFormat.format(inputDate);

                        DateTime parseDate =
                            DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'")
                                .parse(items[index].createdAt.toString());
                        var inputTime = DateTime.parse(parseDate.toString());
                        var inputFormat = DateFormat('hh:mm a');
                        postOnTime = inputFormat.format(inputTime);

                        DateTime pickDate = DateFormat("yyyy-MM-dd")
                            .parse(items[index].pickupDate.toString());
                        var pickDates = DateTime.parse(pickDate.toString());
                        var outputFormats = DateFormat('dd MMMM yyyy');
                        pickUpDate = outputFormats.format(pickDates);

                        DateTime pickTime =
                            DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'")
                                .parse(items[index].pickupDate.toString());
                        var pickTimes = DateTime.parse(pickTime.toString());
                        var inputFormats = DateFormat('hh:mm a');
                        pickUpTime = inputFormats.format(pickTimes);

                        pickUpLocation =
                            "${items[index].pickup?.address?.street}, ${items[index].pickup?.address?.city}, ${items[index].pickup?.address?.district}, ${items[index].pickup?.address?.laneNumber}, ${items[index].pickup?.address?.state}, ${items[index].pickup?.address?.country}, ${items[index].pickup?.address?.postalCode}";

                        finalLocation =
                            "${items[index].receiver?.address?.street}, ${items[index].receiver?.address?.city}, ${items[index].pickup?.address?.district}, ${items[index].pickup?.address?.laneNumber}, ${items[index].receiver?.address?.state}, ${items[index].receiver?.address?.country}, ${items[index].receiver?.address?.postalCode}";

                        final endTime =
                            DateTime.parse("${items[index].postExpiryDate}");
                        Duration remainingTime =
                            endTime.difference(DateTime.now());

                        final formattedTime = _printDuration(remainingTime);

                        return Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.0,
                              left: SizeConfig.screenWidth * 0.0),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.02,
                                  right: SizeConfig.screenWidth * 0.02,
                                  top: SizeConfig.screenHeight * 0.01),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.07),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(2, 2)),
                                  ],
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ExpansionTile(
                                        title: Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  SizeConfig.screenWidth * 0.02,
                                              top: SizeConfig.screenHeight *
                                                  0.01),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right:
                                                        SizeConfig.screenWidth *
                                                            0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Time Left  $formattedTime.",
                                                      style: TextStyle(
                                                          color: CommonColor
                                                              .TO_AREA_COLOR,
                                                          fontSize: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              2.5,
                                                          fontFamily:
                                                              "Roboto_Medium",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .screenHeight *
                                                        0.01),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: SizeConfig
                                                              .screenWidth *
                                                          0.7,
                                                      child: Text(
                                                        companyName[index],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                4.0,
                                                            fontFamily:
                                                                "Roboto_Medium",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .screenHeight *
                                                        0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: SizeConfig
                                                                .screenWidth *
                                                            0.0,
                                                      ),
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: SizeConfig
                                                                .screenWidth *
                                                            0.5,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              color: Colors
                                                                  .transparent,
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.5,
                                                              child: Text(
                                                                "$pickUpLocation ---> $finalLocation",
                                                                style: TextStyle(
                                                                    color: CommonColor
                                                                        .BLACK_COLOR,
                                                                    fontSize:
                                                                        SizeConfig.blockSizeHorizontal *
                                                                            2.0,
                                                                    fontFamily:
                                                                        "Roboto_Medium",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: SizeConfig
                                                                  .screenWidth *
                                                              0.0,
                                                          top: SizeConfig
                                                                  .screenHeight *
                                                              0.01),
                                                      child: Column(
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                                text:
                                                                    '\u{20B9}',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      SizeConfig
                                                                              .blockSizeHorizontal *
                                                                          3.7,
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          ' ${items[index].fare}/-',
                                                                      style: TextStyle(
                                                                          fontSize: SizeConfig.blockSizeHorizontal *
                                                                              4.0,
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight.bold))
                                                                ]),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                top: SizeConfig
                                                                        .screenHeight *
                                                                    0.001),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "(Transport Fare)",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          SizeConfig.blockSizeHorizontal *
                                                                              2.0,
                                                                      height: SizeConfig
                                                                              .screenHeight *
                                                                          0.002),
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
                                                height:
                                                    SizeConfig.screenHeight *
                                                        0.01,
                                              )
                                            ],
                                          ),
                                        ),
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: SizeConfig.screenHeight *
                                                    0.0,
                                                left: SizeConfig.screenWidth *
                                                    0.03,
                                                right: SizeConfig.screenWidth *
                                                    0.03,
                                                bottom:
                                                    SizeConfig.screenHeight *
                                                        0.02),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: getInfoCardLayout(
                                                  SizeConfig.screenHeight,
                                                  SizeConfig.screenWidth,
                                                  index),
                                            ),
                                          ),
                                        ]),
                                    Visibility(
                                        visible: isLoading,
                                        child:
                                            const CircularProgressIndicator())
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                ],
              ),
              Visibility(
                visible: isLoading,
                child: const CircularProgressIndicator(),
              ),
              Visibility(
                visible: items.isEmpty ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.35),
                  child: const Text(
                    "Company Post Not Available.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto_Medium"),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.02),
            child: GestureDetector(
              onTap: () {
                if (companiesName.isEmpty) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text('Update Profile'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Please Firstly Update Your Profile.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Dashboard(isComeFrom:"1")));
                              },
                              child: Container(
                                  height: SizeConfig.screenHeight * 0.04,
                                  width: SizeConfig.screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                      color: CommonColor.APP_BAR_COLOR,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewLoadScreenForm()));
                }
              },
              child: Container(
                height: SizeConfig.screenHeight * 0.05,
                width: SizeConfig.screenWidth * 0.33,
                decoration: BoxDecoration(
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.03),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: SizeConfig.screenHeight * 0.035,
                            width: SizeConfig.screenWidth * 0.07,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                          const Icon(Icons.add)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.02),
                        child: Text(
                          "Post Load",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAdvContainer(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.02,
          left: SizeConfig.screenWidth * 0.03,
          right: SizeConfig.screenWidth * 0.03),
      child: Container(
        height: SizeConfig.screenHeight * 0.2,
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
        child: const Image(
          image: AssetImage("assets/images/adv_demo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getPickUpAndDeliverLocation(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          left: parentWidth * 0.03,
          right: parentWidth * 0.03,
          top: parentHeight * 0.02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(3, 3)),
          ],
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1, top: parentHeight * 0.02),
                      child: GestureDetector(
                        onTap: () {
                          locationType = 1;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: parentWidth * 0.71,
                          child: Text(
                            pickLocation.isEmpty
                                ? "Pick-up Location"
                                : pickLocation,
                            style: TextStyle(
                                color: pickLocation.isEmpty
                                    ? Colors.black26
                                    : Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: parentHeight * 0.015, right: parentWidth * 0.06),
                      child: GestureDetector(
                        onTap: () {
                          locationType = 1;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.search,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: parentHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.0),
                  child: Container(
                    height: SizeConfig.screenWidth * 0.003,
                    color: Colors.black12,
                    child: const Row(
                      children: [
                        Text(
                          "hii",
                          style: TextStyle(color: Colors.transparent),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1, top: parentHeight * 0.015),
                      child: GestureDetector(
                        onTap: () {
                          locationType = 2;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: parentWidth * 0.71,
                          child: Text(
                            dilveryLocation.isEmpty
                                ? "Delivery Location"
                                : dilveryLocation,
                            style: TextStyle(
                                color: dilveryLocation.isEmpty
                                    ? Colors.black26
                                    : Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: parentHeight * 0.015, right: parentWidth * 0.06),
                      child: GestureDetector(
                        onTap: () {
                          locationType = 2;
                          _handlePressButton(locationType);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.search,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: parentHeight * 0.019,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: parentWidth * 0.037,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: parentHeight * 0.016),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight * 0.013,
                          width: parentWidth * 0.026,
                          decoration: const BoxDecoration(
                              color: CommonColor.FROM_AREA_COLOR,
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (mounted) {
                            setState(() {
                              String loc = pickLocation;

                              pickLocation = dilveryLocation;
                              dilveryLocation = loc;
                            });
                          }
                        },
                        child: Container(
                            color: Colors.transparent,
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/add_reverse.png"),
                              height: parentHeight * 0.017,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.013),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight * 0.013,
                          width: parentWidth * 0.026,
                          decoration: const BoxDecoration(
                              color: CommonColor.TO_AREA_COLOR,
                              shape: BoxShape.circle),
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
    );
  }

  Widget getFindingLoadFilter(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight * 0.02,
        left: SizeConfig.screenWidth * 0.03,
        right: parentWidth * 0.03,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Finding Load For",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto_Medium'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.01,
                  right: SizeConfig.screenWidth * 0.04,
                ),
                child: GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    items.clear();
                    refresh();
                    if(isLoading == false){
                      if(mounted){
                        setState(() {
                          isLoading = true;
                        });
                      }
                    }
                  },
                  child: Container(
                      height: SizeConfig.screenHeight * 0.05,
                      width: SizeConfig.screenHeight * 0.053,
                      decoration: BoxDecoration(
                        color: filterType != 0
                            ? Colors.white
                            : CommonColor.SIGN_UP_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: const Offset(2, 4)),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(
                              color: filterType == 0
                                  ? Colors.white
                                  : CommonColor.BLACK_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'),
                        ),
                      )),
                ),
              ),
            ],
          ),

          // Padding(
          //   padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
          //   child: Container(
          //     color: Colors.transparent,
          //     height: SizeConfig.screenHeight*0.07,
          //     child: ListView(
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
          //         bottom: SizeConfig.screenHeight*0.01,
          //       ),
          //       children: <Widget>[
          //
          //         Padding(
          //           padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01,
          //             right: SizeConfig.screenWidth*0.04,),
          //           child: GestureDetector(
          //             onTap: (){
          //               if(mounted){
          //                 setState(() {
          //                   filterType = 0;
          //                 });
          //               }
          //             },
          //             child: Container(
          //                 height: SizeConfig.screenHeight*0.05,
          //                 width: SizeConfig.screenHeight*0.053,
          //                 decoration: BoxDecoration(
          //                   color: filterType != 0 ? Colors.white : CommonColor.SIGN_UP_TEXT_COLOR,
          //                   borderRadius: BorderRadius.circular(10),
          //                   boxShadow: <BoxShadow>[
          //                     BoxShadow(
          //                         color: Colors.black.withOpacity(0.08),
          //                         blurRadius: 3,
          //                         spreadRadius: 2,
          //                         offset: const Offset(2, 4)),
          //                   ],
          //                 ),
          //                 child: Center(
          //                   child: Text("All",
          //                     style: TextStyle(
          //                         color: filterType == 0 ? Colors.white : CommonColor.BLACK_COLOR,
          //                         fontSize: SizeConfig.blockSizeHorizontal*4.0,
          //                         fontWeight: FontWeight.w500,
          //                         fontFamily: 'Roboto_Medium'
          //                     ),),
          //                 )
          //             ),
          //           ),
          //         ),
          //
          //         Padding(
          //           padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,
          //             right: SizeConfig.screenWidth*0.04,),
          //           child: GestureDetector(
          //
          //             onTap: (){
          //               if(mounted){
          //                 setState(() {
          //                   filterType = 1;
          //                 });
          //               }
          //             },
          //             child: Container(
          //                 height: SizeConfig.screenHeight*0.05,
          //                 width: SizeConfig.screenHeight*0.14,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(10),
          //                   boxShadow: <BoxShadow>[
          //                     BoxShadow(
          //                         color: Colors.black.withOpacity(0.08),
          //                         blurRadius: 3,
          //                         spreadRadius: 2,
          //                         offset: const Offset(2, 4)),
          //                   ],
          //                 ),
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01, right: SizeConfig.screenWidth*0.01),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //
          //                       Container(
          //                         height: SizeConfig.screenHeight*0.03,
          //                         width: SizeConfig.screenWidth*0.06,
          //                         decoration: BoxDecoration(
          //                             color: filterType != 1 ? CommonColor.UNSELECT_TYPE_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
          //                             shape: BoxShape.circle
          //                         ),
          //                       ),
          //
          //                       Text("Open Body",
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: SizeConfig.blockSizeHorizontal*4.0,
          //                             fontWeight: FontWeight.w500,
          //                             fontFamily: 'Roboto_Medium'
          //                         ),),
          //                     ],
          //                   ),
          //                 )
          //             ),
          //           ),
          //         ),
          //
          //         Padding(
          //           padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,
          //             right: SizeConfig.screenWidth*0.04,),
          //           child: GestureDetector(
          //             onTap: (){
          //               if(mounted){
          //                 setState(() {
          //                   filterType = 2;
          //                 });
          //               }
          //             },
          //             child: Container(
          //                 height: SizeConfig.screenHeight*0.05,
          //                 width: SizeConfig.screenHeight*0.16,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(10),
          //                   boxShadow: <BoxShadow>[
          //                     BoxShadow(
          //                         color: Colors.black.withOpacity(0.08),
          //                         blurRadius: 3,
          //                         spreadRadius: 2,
          //                         offset: const Offset(2, 4)),
          //                   ],
          //                 ),
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01, right: SizeConfig.screenWidth*0.01),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //
          //                       Container(
          //                         height: SizeConfig.screenHeight*0.03,
          //                         width: SizeConfig.screenWidth*0.06,
          //                         decoration: BoxDecoration(
          //                             color: filterType != 2 ? CommonColor.UNSELECT_TYPE_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
          //                             shape: BoxShape.circle
          //                         ),
          //                       ),
          //
          //                       Text("Closed Body",
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: SizeConfig.blockSizeHorizontal*4.0,
          //                             fontWeight: FontWeight.w500,
          //                             fontFamily: 'Roboto_Medium'
          //                         ),),
          //                     ],
          //                   ),
          //                 )
          //             ),
          //           ),
          //         ),
          //
          //         Padding(
          //           padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.0,
          //             right: SizeConfig.screenWidth*0.04,),
          //           child: GestureDetector(
          //
          //             onTap: (){
          //               if(mounted){
          //                 setState(() {
          //                   filterType = 3;
          //                 });
          //               }
          //             },
          //             child: Container(
          //                 height: SizeConfig.screenHeight*0.05,
          //                 width: SizeConfig.screenHeight*0.11,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(10),
          //                   boxShadow: <BoxShadow>[
          //                     BoxShadow(
          //                         color: Colors.black.withOpacity(0.08),
          //                         blurRadius: 3,
          //                         spreadRadius: 2,
          //                         offset: const Offset(2, 4)),
          //                   ],
          //                 ),
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01, right: SizeConfig.screenWidth*0.01),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //
          //                       Container(
          //                         height: SizeConfig.screenHeight*0.03,
          //                         width: SizeConfig.screenWidth*0.06,
          //                         decoration: BoxDecoration(
          //                             color: filterType != 3 ? CommonColor.UNSELECT_TYPE_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
          //                             shape: BoxShape.circle
          //                         ),
          //                       ),
          //
          //                       Text("Trailor",
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: SizeConfig.blockSizeHorizontal*4.0,
          //                             fontWeight: FontWeight.w500,
          //                             fontFamily: 'Roboto_Medium'
          //                         ),),
          //                     ],
          //                   ),
          //                 )
          //             ),
          //           ),
          //         ),
          //
          //       ],
          //     ),
          //   )
          //   Padding(
          //     padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01,
          //       right: SizeConfig.screenWidth*0.04,),
          //     child: GestureDetector(
          //       onTap: (){
          //         if(mounted){
          //           setState(() {
          //             filterType = 0;
          //           });
          //         }
          //       },
          //       child: Container(
          //           height: SizeConfig.screenHeight*0.05,
          //           width: SizeConfig.screenHeight*0.053,
          //           decoration: BoxDecoration(
          //             color: filterType != 0 ? Colors.white : CommonColor.SIGN_UP_TEXT_COLOR,
          //             borderRadius: BorderRadius.circular(10),
          //             boxShadow: <BoxShadow>[
          //               BoxShadow(
          //                   color: Colors.black.withOpacity(0.08),
          //                   blurRadius: 3,
          //                   spreadRadius: 2,
          //                   offset: const Offset(2, 4)),
          //             ],
          //           ),
          //           child: Center(
          //             child: Text("All",
          //               style: TextStyle(
          //                   color: filterType == 0 ? Colors.white : CommonColor.BLACK_COLOR,
          //                   fontSize: SizeConfig.blockSizeHorizontal*4.0,
          //                   fontWeight: FontWeight.w500,
          //                   fontFamily: 'Roboto_Medium'
          //               ),),
          //           )
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth, postIndex) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.00),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: parentWidth * 0.05,
                ),
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
                              shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.02),
                          child: Container(
                            width: parentWidth * 0.57,
                            color: Colors.transparent,
                            child: Text(
                              pickUpLocation,
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
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
                              shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth * 0.02),
                          child: Container(
                            width: parentWidth * 0.6,
                            color: Colors.transparent,
                            child: Text(
                              finalLocation,
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: parentWidth * 0.05, top: parentHeight * 0.01),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: parentHeight * 0.02,
                              width: parentWidth * 0.045,
                              decoration: const BoxDecoration(
                                  color: CommonColor.UNSELECT_TYPE_COLOR,
                                  shape: BoxShape.circle),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: parentWidth * 0.015),
                              child: Text(
                                items[postIndex]
                                    .loadDetail!
                                    .loadType
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3.0,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.screenHeight * 0.0,
                                  left: parentWidth * 0.02),
                              child: Container(
                                height: SizeConfig.screenWidth * 0.05,
                                width: parentWidth * 0.003,
                                color: Colors.black12,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: parentWidth * 0.015),
                              child: Text(
                                "${items[postIndex].loadDetail!.load.toString()} ${items[postIndex].loadDetail!.loadUnit.toString()} ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3.0,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: parentWidth * 0.05,
                      ),
                      child: GestureDetector(
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
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: CompanyVerifyDialog(
                                    companyId: items[postIndex]
                                        .pickup!
                                        .customer
                                        .toString(), postStatus: items[postIndex].status.toString(),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          height: parentHeight * 0.025,
                          width: parentWidth * 0.16,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: parentWidth * 0.01,
                                right: parentWidth * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: parentWidth * 0.1,
                                  child: Text(
                                    companyName[postIndex],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto_Medium',
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 2.7,
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
                Padding(
                  padding: EdgeInsets.only(top: parentHeight * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: parentHeight * 0.02,
                                width: parentWidth * 0.045,
                                decoration: const BoxDecoration(
                                    color: CommonColor.UNSELECT_TYPE_COLOR,
                                    shape: BoxShape.circle),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: parentWidth * 0.015),
                                child: Row(
                                  children: [
                                    Text(
                                      "${items[postIndex].vehicle?.vehicleType}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  3.2,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto_Regular'),
                                    ),
                                    Visibility(
                                      visible: items[postIndex]
                                                  .vehicle
                                                  ?.vehicleType ==
                                              "Trailor"
                                          ? true
                                          : false,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: parentWidth * 0.01),
                                        child: Text(
                                          "(${items[postIndex].vehicle?.trailorType})",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3.2,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Regular'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.screenHeight * 0.0,
                                    left: parentWidth * 0.02),
                                child: Container(
                                  height: SizeConfig.screenWidth * 0.05,
                                  width: parentWidth * 0.003,
                                  color: Colors.black12,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: parentWidth * 0.015),
                                child: Text(
                                  "${items[postIndex].vehicle!.capacity} (${items[postIndex].vehicle!.capacityUnit})",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.0,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: parentHeight * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: parentHeight * 0.02,
                            width: parentWidth * 0.045,
                            decoration: const BoxDecoration(
                                color: CommonColor.UNSELECT_TYPE_COLOR,
                                shape: BoxShape.circle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: parentWidth * 0.015),
                            child: Container(
                              color: Colors.transparent,
                              width: parentWidth * 0.75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No. of vehicle ${items[postIndex].vehicle!.quantity}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal *
                                                3.0,
                                        fontFamily: "Roboto_Regular",
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: parentHeight * 0.00,
                                        left: parentWidth * 0.03),
                                    child: GestureDetector(
                                      onTap: () {
                                        passPickIndexAddress =
                                            "${items[postIndex].pickup?.address?.street}, ${items[postIndex].pickup?.address?.city}, ${items[postIndex].pickup?.address?.district}, ${items[postIndex].pickup?.address?.laneNumber} ${items[postIndex].pickup?.address?.state}, ${items[postIndex].pickup?.address?.country}, ${items[postIndex].pickup?.address?.postalCode}";

                                        passLastIndexAddress =
                                            "${items[postIndex].receiver?.address?.street}, ${items[postIndex].receiver?.address?.city}, ${items[postIndex].receiver?.address?.state}, ${items[postIndex].receiver?.address?.country}, ${items[postIndex].receiver?.address?.postalCode}";

                                        DateTime tempDate =
                                            DateFormat("yyyy-MM-dd").parse(
                                                items[postIndex]
                                                    .pickupDate
                                                    .toString());
                                        var inputDate =
                                            DateTime.parse(tempDate.toString());
                                        var outputFormat =
                                            DateFormat('dd MMMM yyyy');
                                        pickUpIndexDate =
                                            outputFormat.format(inputDate);

                                        DateTime parseDate = DateFormat(
                                                "yyyy-MM-dd HH:mm:ss.SSS'Z'")
                                            .parse(items[postIndex]
                                                .pickupDate
                                                .toString());
                                        var inputTime = DateTime.parse(
                                            parseDate.toString());
                                        var inputFormat = DateFormat('hh:mm a');
                                        pickUpIndexTime =
                                            inputFormat.format(inputTime);

                                        showCupertinoDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (context) {
                                            return AnimatedOpacity(
                                                opacity: 1.0,
                                                duration:
                                                    const Duration(seconds: 2),
                                                child: LoadMoreInfoDialog(
                                                  isComeFrom: '',
                                                  postDetails: items,
                                                  postIndex: postIndex,
                                                  pickupDate: pickUpIndexDate,
                                                  pickupTime: pickUpIndexTime,
                                                  pickupLocation:
                                                      passPickIndexAddress,
                                                  finalLocation:
                                                      passLastIndexAddress,
                                                ));
                                          },
                                        );
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessTimelinePage()));
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            "More",
                                            style: TextStyle(
                                                color: CommonColor
                                                    .SIGN_UP_TEXT_COLOR,
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal *
                                                    3.7,
                                                fontFamily: "Roboto_Regular ",
                                                fontWeight: FontWeight.w500),
                                          ),
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: parentHeight * 0.012, right: parentWidth * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              elevation: 10,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext bc) {
                                return BidNowPriceDialog(
                                  isComeFrom: '2',
                                  mainPrice: (items[postIndex].lowestBid == 0
                                          ? items[postIndex].fare
                                          : items[postIndex].lowestBid) ??
                                      0,
                                  bidAmount: items[postIndex].lowestBid ?? 0,
                                  postDetails: items,
                                  postIndex: postIndex,
                                  companyName: companyName[postIndex],
                                );
                              });
                        },
                        child: Container(
                          width: SizeConfig.screenWidth * 0.18,
                          height: SizeConfig.screenHeight * 0.035,
                          decoration: BoxDecoration(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bid Now",
                                style: TextStyle(
                                    color: CommonColor.WHITE_COLOR,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Medium'),
                              ),
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
        ],
      ),
    );
  }

  Future<void> _handlePressButton(int locType) async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      offset: 0,
      radius: 1000,
      types: [],
      strictbounds: false,
      components: [],
    );

    // displayPrediction(p);
    setState(
      () {
        print("${p?.description}");

        if (locType == 1) {
          pickLocation = p?.description ?? "";
        } else {
          dilveryLocation = p?.description ?? "";
        }
      },
    );
  }
}

abstract class HomeChildScreenListener {}
