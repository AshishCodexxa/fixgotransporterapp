import 'dart:io';

import 'package:fixgotransporterapp/all_dialogs/open_camera_gallery_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';




class NewLoadScreenForm extends StatefulWidget {



  const NewLoadScreenForm({Key? key}) : super(key: key);

  @override
  State<NewLoadScreenForm> createState() => _NewLoadScreenFormState();
}

class _NewLoadScreenFormState extends State<NewLoadScreenForm> {


  int addDeliveryCount = 0;

  bool isChecked = false;

  TextEditingController dateInput = TextEditingController();
  TextEditingController quantityLoadController = TextEditingController();
  TextEditingController descriptionLoadController = TextEditingController();
  TextEditingController carryingCapacityController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController totalFareController = TextEditingController();

  String? pickUpDate;
  String? bidEndDate;
  DateTime? pickedDates;

  String employeeValue = 'Type of Load';
  String vehicleValue = 'Type of Vehicle';

  bool showAllGoodsField = true;
  bool showAllVehicleTypes = true;
  bool hideAllGoodsField = false;
  bool hideAllVehicleTypeField = false;
  bool showLoadField = false;
  bool showVehicleType = false;

  bool lengthWidthVehicle = false;

  bool advPayAmountShow = false;
  bool deliverPayAmountShow = false;

  bool paymentFieldShow = true;
  bool paymentFieldHide = false;

  int PackLoad = 1;
  int LooseLoad = 2;
  int OverDimensional = 3;

  int loadType = 0;
  String typeLoad = "";

  int vehicleType = 0;
  String vehicleName = "";

  int loadUnit = 0;
  String loadUnits = "";

  int advancePay = 0;
  int deliveryPay = 0;

  int advPay = 0;
  String advPayMethod = "";

  int deliverPay = 0;
  String deliveryPayMethod = "";

  List<XFile> images = [];


  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Container(
            color: CommonColor.WHITE_COLOR,
            height: SizeConfig.safeUsedHeight * .88,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
              children: [

                getPickUpAndDeliverLocation(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getPickAndEndDate(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getGoodsLoadLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getVehicleDetails(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getPaymentDetailsLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getSubmitButton(SizeConfig.screenHeight, SizeConfig.screenWidth),

              ],
            ),
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
            onDoubleTap: (){},
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
            child: Text("Interested Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }

  Widget getPickUpAndDeliverLocation(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03,
      right: parentWidth*0.03,
      top: parentHeight*0.02),
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
          alignment: Alignment.topLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.02),
                      child: GestureDetector(
                        onDoubleTap: (){},
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PreviousAddressListScreen()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text("Pick-up Location",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: parentHeight*0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.017),
                      child: GestureDetector(
                        onDoubleTap: (){},
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryLocationScreen()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text("Delivery",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),
                      ),
                    ),
                  /* Container(
                     color: Colors.transparent,
                     width: parentWidth*0.14,
                     child: Row(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(top: parentHeight*0.007,
                           ),
                           child: Image(image: AssetImage("assets/images/vertical_divider.png")),
                         ),
                         GestureDetector(
                           onDoubleTap: (){},
                           onTap: (){
                             addDeliveryCount++;
                             if(mounted){
                               setState(() {

                               });
                             }
                           },
                           child: Container(
                             color: Colors.transparent,
                             child: Padding(
                               padding: EdgeInsets.only(top: parentHeight*0.01,
                                   left: parentWidth*0.03),
                               child: Icon(Icons.add_circle_outline_rounded,
                               color: Colors.black,),
                             ),
                           ),
                         )
                       ],
                     ),
                   )*/
                  ],
                ),

                SizedBox(
                  height: parentHeight*0.01,
                ),

               /* for(int i = 0; i < addDeliveryCount ; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.007),
                      child: Text("Delivery",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                   Container(
                     color: Colors.transparent,
                     width: parentWidth*0.14,
                     child: Row(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(top: parentHeight*0.007,
                           ),
                           child: Image(image: AssetImage("assets/images/vertical_divider.png")),
                         ),
                         GestureDetector(
                           onDoubleTap: (){},
                           onTap: (){
                             addDeliveryCount--;
                             if(mounted){
                               setState(() {

                               });
                             }
                           },
                           child: Container(
                             color: Colors.transparent,
                             child: Padding(
                               padding: EdgeInsets.only(top: parentHeight*0.01,
                                   left: parentWidth*0.03),
                               child: Icon(Icons.remove_circle_outline_rounded,
                               color: Colors.black,),
                             ),
                           ),
                         )
                       ],
                     ),
                   )
                  ],
                ),*/
                SizedBox(
                  height: parentHeight*0.007,
                ),

              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.037,
              top: parentHeight*0.025),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: parentHeight*0.013,
                        width: parentWidth*0.026,
                        decoration: BoxDecoration(
                            color: CommonColor.FROM_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.012,
                    top: parentHeight*0.005,
                    bottom: parentHeight*0.005,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight*0.037,
                          width: parentWidth*0.003,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: parentHeight*0.013,
                        width: parentWidth*0.026,
                        decoration: BoxDecoration(
                            color: CommonColor.TO_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPickAndEndDate(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03,
          right: parentWidth*0.03,
          top: parentHeight*0.02),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05),
              child: GestureDetector(
                onDoubleTap: (){},
                onTap: () async {
                    pickedDates = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 1)),
                      lastDate: DateTime(2100));

                  if (pickedDates != null) {
                    print(
                        pickedDates); //pickedDate output format => 2021-03-10 00:00:00.000
                    pickUpDate =
                    DateFormat('dd-MM-yyyy').format(pickedDates!);
                    print(
                        pickUpDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          pickUpDate.toString(); //set output date to TextField value.
                    });
                  } else {}


                },
                child: Container(
                  width: parentWidth*0.3,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Icon(Icons.date_range_outlined,
                        color: Colors.black,),

                      Text(pickUpDate == null ?"Pick-up Date":"${pickUpDate}",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w500,
                            color: pickUpDate == null ? Colors.black54 : Colors.black
                        ),),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: parentHeight*0.003,
              bottom: parentHeight*0.005),
              child: Container(
                height: parentHeight*0.05,
                width: parentWidth*0.001,
                color: Colors.black54,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: parentWidth*0.03),
              child: GestureDetector(
                onDoubleTap: (){},
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: pickedDates!,
                      firstDate: DateTime.now().subtract(Duration(days: 1)),
                      lastDate: DateTime(2100));

                  DateTime dt2 = DateTime.parse("$pickedDates");

                  if (pickedDate != null && pickedDate != pickedDates && pickedDate.isAfter(dt2)) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    bidEndDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        bidEndDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          bidEndDate.toString(); //set output date to TextField value.
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                            Text("Bidding Date must be greater than Pick Up Date.")));
                  }


                },
                child: Container(
                  color: Colors.transparent,
                  width: parentWidth*0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(Icons.date_range_outlined,
                        color: Colors.black,),

                      Text(bidEndDate == null ? "  Bidding End Date" : "  ${bidEndDate}",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w500,
                            color:bidEndDate == null ? Colors.black54 : Colors.black
                        ),),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget getGoodsLoadLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03,
          right: parentWidth*0.03,
          top: parentHeight*0.02),
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
          children: [
            Visibility(
              visible: showAllGoodsField,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: parentHeight * 0.02,
                    top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Goods/Load",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*5.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.transparent,
                    height: parentHeight*0.07,
                    child: Row(
                      children: [

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.01),
                            child: TextFormField(
                              controller: quantityLoadController,
                              // focusNode: _userNameFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                label: Text("Qty. of Goods/Load",
                                  style: TextStyle(
                                    color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),),
                                contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.02),
                          child: Container(
                            width: parentWidth*0.31,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onDoubleTap: (){},
                                  onTap: (){
                                    if(mounted){
                                      setState(() {
                                        loadUnit = 1;
                                        loadUnits = "Ton(s)";
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: parentHeight*0.025,
                                    width: parentWidth*0.15,
                                    decoration: BoxDecoration(
                                        color:loadUnit == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WEIGHT_COLOR,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                                      child: Text("Ton(s)",
                                        style: TextStyle(
                                            color:loadUnit == 1 ? Colors.white : Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontFamily: 'Roboto_Regular'
                                        ),),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onDoubleTap: (){},
                                  onTap: (){
                                    if(mounted){
                                      setState(() {
                                        loadUnit = 2;
                                        loadUnits = "Kg(s)";
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: parentHeight*0.025,
                                    width: parentWidth*0.15,
                                    decoration: BoxDecoration(
                                      color:loadUnit == 2 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WEIGHT_COLOR,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                                      child: Text("Kg(s)",
                                        style: TextStyle(
                                            color:loadUnit == 2 ? Colors.white : Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontFamily: 'Roboto_Regular'
                                        ),),
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

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
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

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        top: parentHeight*0.02),
                    child: GestureDetector(
                      onDoubleTap: (){},
                      onTap: (){
                        showLoadField = !showLoadField;
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
                            RichText(
                              text: TextSpan(
                                  text: loadType == 0 ? 'Type of Load' : typeLoad,
                                  style: TextStyle(
                                    color: loadType == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0)
                                    : Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.05),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: showLoadField,
                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.02,),
                      child: Column(
                        children: [

                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 1;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Pack Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                        color:loadType == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Pack Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                            left: parentWidth*0.03,
                            right: parentWidth*0.03),
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
                          Padding(
                            padding:  EdgeInsets.only(
                                left: parentWidth*0.05,
                            top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 2;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Loose Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                          color:loadType == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Loose Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05,
                            top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 3;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Over Dimensional Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                          color:loadType == 3 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Over Dimensional Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
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

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
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

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: images.length == 0 ? 'Upload Image' : "${images.length} Images Selected",
                              style: TextStyle(
                                color: images.length == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0) : Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              ),
                              children: [
                                TextSpan(
                                    text: '  (maximum 3 imgs)',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.05),
                          child: GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              showModalBottomSheet<List<XFile>>(
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
                                      child: CameraGalleryDialog(),
                                    );
                                  }).then((value) {
                                    if(value == null) {
                                      //no image
                                      return;
                                    }
                                    setState(() {
                                      images.length < 3 ?
                                      images.addAll(value) :
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content:
                                              Text("You can upload only 3 Images")));
                                    });

                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Image(image: AssetImage("assets/images/camera.png"),
                              color: Colors.black,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
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

                  Visibility(
                    visible: loadType == 3? true : false,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
                          child: Row(
                            children: [
                              Text("Size of Load",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: parentWidth * 0.05,
                              right: parentWidth * 0.05,
                              top: parentHeight*0.015),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: parentWidth * 0.05),
                                  child: Container(
                                    height: parentHeight*0.05,
                                    child: TextFormField(
                                      controller: lengthController,
                                      // focusNode: _cityFocus,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        label: RichText(
                                          text: TextSpan(
                                            text: 'Length(Mts)',
                                            style: TextStyle(
                                              color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*2.8,
                                            ),
                                          ),
                                        ),
                                        labelStyle: TextStyle(
                                            color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                            fontFamily: 'Roboto_Regular'),
                                        border: const OutlineInputBorder(
                                            borderSide:
                                            BorderSide(width: 1.0, color: Colors.black)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                            BorderSide(width: 1.0, color: Colors.black)),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: parentWidth * 0.05),
                                  child: Container(
                                    height: parentHeight*0.05,
                                    child: TextFormField(
                                      controller: lengthController,
                                      // focusNode: _cityFocus,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        label: RichText(
                                          text: TextSpan(
                                            text: 'Width(Mts)',
                                            style: TextStyle(
                                              color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*2.8,
                                            ),
                                          ),
                                        ),
                                        labelStyle: TextStyle(
                                            color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                            fontFamily: 'Roboto_Regular'),
                                        border: const OutlineInputBorder(
                                            borderSide:
                                            BorderSide(width: 1.0, color: Colors.black)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                            BorderSide(width: 1.0, color: Colors.black)),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: parentWidth * 0.05),
                                  child: Container(
                                    height: parentHeight*0.05,
                                    child: TextFormField(
                                      controller: lengthController,
                                      // focusNode: _cityFocus,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        label: RichText(
                                          text: TextSpan(
                                            text: 'Height',
                                            style: TextStyle(
                                              color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*2.8,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        labelStyle: TextStyle(
                                            color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                            fontFamily: 'Roboto_Regular'),
                                        border: const OutlineInputBorder(
                                            borderSide:
                                            BorderSide(width: 1.0, color: Colors.black)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                            BorderSide(width: 1.0, color: Colors.black)),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
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
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.01),
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        controller: descriptionLoadController,
                        // focusNode: _userNameFocus,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          label: Text("Description",
                            style: TextStyle(
                              color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            ),),
                          contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                        ),
                        maxLines: 3,
                        minLines: 1,
                        onFieldSubmitted: (value){
                          showAllGoodsField = !showAllGoodsField;
                          hideAllGoodsField = !hideAllGoodsField;
                        },
                      ),

                    ),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )

                ],
              ),
            ),

            Visibility(
              visible: hideAllGoodsField,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    right: parentWidth*0.05,
                    top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Load Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                showAllGoodsField = !showAllGoodsField;
                                hideAllGoodsField = !hideAllGoodsField;
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(Icons.edit,
                            size: parentHeight*0.025,),
                          ),
                        )

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.02,
                    left: parentWidth*0.05,
                    right: parentWidth*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      if(images.isNotEmpty)
                        // for(var file in images)
                          for(int i=0; i<images.length;i++)
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.06),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: parentHeight*0.085,
                                    width: parentWidth*0.195,
                                    color: Colors.transparent,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.007),
                                    child: Container(
                                      height: parentHeight*0.077,
                                      width: parentWidth*0.18,
                                      decoration: BoxDecoration(
                                        color: CommonColor.UNSELECT_TYPE_COLOR,
                                        border: Border.all(color: Colors.black54)
                                      ),
                                      child: Image.file(File(images[i].path),
                                      fit: BoxFit.cover,),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: parentHeight*0.03),
                                child: GestureDetector(
                                  onDoubleTap: (){},
                                  onTap: (){
                                    print("clear");
                                    images.removeAt(i);
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Icon(Icons.clear,
                                          color: Colors.black,
                                      size: parentHeight*0.015,),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        if(images.isEmpty)
                          for(int i=0; i<3;i++)

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.06),
                              child: Container(
                                height: parentHeight*0.085,
                                width: parentWidth*0.195,
                                color: CommonColor.UNSELECT_TYPE_COLOR,
                              ),
                            ),



                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.01,
                    left: parentWidth*0.05),
                    child: Row(
                      children: [

                        Text("Type of Load :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Text(" Over Dimensional Load",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.7,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Container(
                            height: parentHeight*0.04,
                            width: parentWidth*0.002,
                            color: Colors.black26,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Text("10 Ton(s)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    right: parentWidth*0.05,
                    top: parentHeight*0.01),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Regular'
                      ),),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getVehicleDetails(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03,
          right: parentWidth*0.03,
          top: parentHeight*0.02),
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
          children: [
            Visibility(
              visible: showAllVehicleTypes,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: parentHeight * 0.02,
                        top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Vehicle",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*5.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        top: parentHeight*0.02),
                    child: GestureDetector(
                      onDoubleTap: (){},
                      onTap: (){
                        showVehicleType = !showVehicleType;
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
                            RichText(
                              text: TextSpan(
                                text: vehicleType == 0 ? 'Type of Vehicle' : vehicleName,
                                style: TextStyle(
                                  color: vehicleType == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0)
                                      : Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.05),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: showVehicleType,
                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.02,),
                      child: Column(
                        children: [

                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showVehicleType = !showVehicleType;
                                vehicleType = 1;
                                if(mounted){
                                  setState(() {
                                    vehicleName = "Open body";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:vehicleType == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Open body",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                          Padding(
                            padding:  EdgeInsets.only(
                                left: parentWidth*0.05,
                                top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showVehicleType = !showVehicleType;
                                vehicleType = 2;
                                if(mounted){
                                  setState(() {
                                    vehicleName = "Closed body";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:vehicleType == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Closed body",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05,
                                top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showVehicleType = !showVehicleType;
                                vehicleType = 3;
                                if(mounted){
                                  setState(() {
                                    vehicleName = "Trailor";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:vehicleType == 3 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Trailor",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05,
                                top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showVehicleType = !showVehicleType;
                                vehicleType = 4;
                                if(mounted){
                                  setState(() {
                                    vehicleName = "Container";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:vehicleType == 4 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Container",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
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

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
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

                  Container(
                    color: Colors.transparent,
                    height: parentHeight*0.07,
                    child: Row(
                      children: [

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.01),
                            child: TextFormField(
                              controller: carryingCapacityController,
                              // focusNode: _userNameFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                label: Text("Carrying Capacity",
                                  style: TextStyle(
                                    color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),),
                                contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.0),
                          child: Container(
                            width: parentWidth*0.31,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: parentHeight*0.025,
                                  width: parentWidth*0.15,
                                  decoration: BoxDecoration(
                                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text("RLW (kg)",
                                      style: TextStyle(
                                          color: CommonColor.WHITE_COLOR,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontFamily: 'Roboto_Regular'
                                      ),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),

                  ),

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
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

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                    child: TextFormField(
                      controller: vehicleNumberController,
                      // focusNode: _userNameFocus,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        label: Text("No. of Vehicle (e.g. 01 )",
                          style: TextStyle(
                            color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          ),),
                        contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                      ),
                      onFieldSubmitted: (val){
                        if(mounted){
                          setState(() {
                            hideAllVehicleTypeField = !hideAllVehicleTypeField;
                            showAllVehicleTypes = !showAllVehicleTypes;
                          });
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.01,
                      left: SizeConfig.screenWidth*0.03,
                      right: SizeConfig.screenWidth*0.05,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.07,
                          width: SizeConfig.screenWidth * 0.07,
                          child: Column(
                            children: <Widget>[
                              Checkbox(
                                activeColor: CommonColor.SIGN_UP_TEXT_COLOR,
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                    if(isChecked == true){
                                      lengthWidthVehicle = !lengthWidthVehicle;
                                    }else{
                                      lengthWidthVehicle = !lengthWidthVehicle;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01,
                              bottom: parentHeight*0.015),
                              child: Text("Length & Width of Vehicle",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    fontFamily: 'Roboto_Medium'
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Visibility(
                    visible: lengthWidthVehicle,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.05,
                          right: parentWidth * 0.05),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: parentWidth * 0.05),
                              child: Container(
                                height: parentHeight*0.06,
                                child: TextFormField(
                                  controller: lengthController,
                                  // focusNode: _cityFocus,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    label: RichText(
                                      text: TextSpan(
                                          text: 'Length(Ft.)',
                                          style: TextStyle(
                                            color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                          ),
                                         ),
                                    ),
                                    labelStyle: TextStyle(
                                        color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                        fontFamily: 'Roboto_Regular'),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1.0, color: Colors.black)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1.0, color: Colors.black)),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: parentWidth * 0.05),
                              child: Container(
                                height: parentHeight*0.06,
                                child: TextFormField(
                                  controller: widthController,
                                  // focusNode: _zipCodeFocus,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Width(Ft.)",
                                    labelStyle: TextStyle(
                                        color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                        fontFamily: 'Roboto_Regular'),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1.0, color: Colors.black)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1.0, color: Colors.black)),
                                  ),
                                  textAlign: TextAlign.center,
                                  onFieldSubmitted: (val){
                                    if(mounted){
                                      setState(() {
                                        hideAllVehicleTypeField = !hideAllVehicleTypeField;
                                        showAllVehicleTypes = !showAllVehicleTypes;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )

                ],
              ),
            ),

            Visibility(
              visible: hideAllVehicleTypeField,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        right: parentWidth*0.05,
                        top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Vehicles",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                hideAllVehicleTypeField = !hideAllVehicleTypeField;
                                showAllVehicleTypes = !showAllVehicleTypes;
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(Icons.edit,
                              size: parentHeight*0.025,),
                          ),
                        )

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.01,
                        left: parentWidth*0.05,
                        right: parentWidth*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Text("$vehicleName",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Container(
                          height: parentHeight*0.035,
                          width: parentWidth*0.003,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        ),

                        Text("1550 RLW(kg)",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Container(
                          height: parentHeight*0.035,
                          width: parentWidth*0.003,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        ),

                        Text("  L : 40 ft.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Text("W : 08 ft.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    top: parentHeight*0.01),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'No. Of Vehicle :',
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              ),
                              children: [
                                TextSpan(
                                    text: ' 04',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPaymentDetailsLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.03,
          right: parentWidth*0.03,
          top: parentHeight*0.02),
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
          children: [
            Visibility(
              visible: paymentFieldShow,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.02),
                        child: Text("Payment Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.transparent,
                    height: parentHeight*0.07,
                    child: Row(
                      children: [

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.01),
                            child: TextFormField(
                              controller: quantityLoadController,
                              // focusNode: _userNameFocus,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                label: Text("Total Fare",
                                  style: TextStyle(
                                    color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),),
                                contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                                prefixText: "\u{20B9}",
                                prefixStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockSizeHorizontal*5.0
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black12)
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black12)
                                ),
                              ),
                              style: TextStyle(
                                  color: CommonColor.REGISTER_HINT_COLOR.withOpacity(0.5),
                                  fontSize: SizeConfig.blockSizeHorizontal*5.0
                              ),onFieldSubmitted: (val){
                                if(mounted){
                                  setState(() {
                                    paymentFieldHide = !paymentFieldHide;
                                    paymentFieldShow = !paymentFieldShow;
                                  });
                                }
                            },
                            ),
                          ),
                        ),

                      ],
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.007),
                        child: Text("Advance Payment Will Be Given By",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: parentWidth*0.03,
                            top: parentHeight*0.01),
                        child: Row(
                          children: [

                            Container(
                              height: parentHeight*0.027,
                              width: parentWidth*0.07,
                              decoration: BoxDecoration(
                                color: CommonColor.ADVANCE_INCREMENT_COLOR,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Icon(Icons.remove,
                              color: Colors.white,
                                size: parentHeight*0.02,),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.02, right: parentWidth*0.02),
                              child: Text("50 %",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto_Regular'
                                ),),
                            ),

                            Container(
                              height: parentHeight*0.027,
                              width: parentWidth*0.07,
                              decoration: BoxDecoration(
                                  color: CommonColor.ADVANCE_INCREMENT_COLOR,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Icon(Icons.add,
                                color: Colors.white,
                              size: parentHeight*0.02,),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: parentHeight*0.015,
                      left: parentWidth*0.05,
                      right: parentWidth*0.25
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                advancePay = 1;

                                if(advPayAmountShow == false){
                                  advPayAmountShow = !advPayAmountShow;
                                }


                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [

                                Container(
                                  height: parentHeight*0.03,
                                  width: parentWidth*0.06,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                      color:advancePay == 1 ? CommonColor.SIGN_UP_TEXT_COLOR
                                          : CommonColor.WHITE_COLOR
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Company",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: 'Roboto_Regular'
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                advancePay = 2;
                                if(advPayAmountShow == false){
                                  advPayAmountShow = !advPayAmountShow;
                                }
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [

                                Container(
                                  height: parentHeight*0.03,
                                  width: parentWidth*0.06,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                      color:advancePay == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                          : CommonColor.WHITE_COLOR
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: parentWidth*0.03),
                                  child: Text("Receiver",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                        fontFamily: 'Roboto_Regular'
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
                  Visibility(
                    visible: advPayAmountShow,
                    child: Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.05,right: parentWidth*0.05,
                      top: parentHeight*0.015),
                      child: Container(
                        height: parentHeight*0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black12)
                        ),
                        child: Row(
                          children: [

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.03),
                              child: Icon(Icons.currency_rupee,
                              color: Colors.black,
                              size: parentHeight*0.022,),
                            ),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: parentHeight*0.01),
                                child: TextFormField(
                                  controller: quantityLoadController,
                                  // focusNode: _userNameFocus,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText:"6000",
                                    hintStyle: TextStyle(
                                      color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*6.0,
                                    ),
                                    contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05,
                                    bottom: parentHeight*0.016),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent)
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent)
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.02),
                              child: Container(
                                width: parentWidth*0.31,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: (){},
                                      onTap: (){
                                        if(mounted){
                                          setState(() {
                                            advPay = 1;
                                            advPayMethod = "Online";
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: parentHeight*0.025,
                                        width: parentWidth*0.15,
                                        decoration: BoxDecoration(
                                            color:advPay == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WEIGHT_COLOR,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text("Online",
                                            style: TextStyle(
                                                color:advPay == 1 ? Colors.white : Colors.black54,
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                fontFamily: 'Roboto_Regular'
                                            ),),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onDoubleTap: (){},
                                      onTap: (){
                                        if(mounted){
                                          setState(() {
                                            advPay = 2;
                                            advPayMethod = "Cash";
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: parentHeight*0.025,
                                        width: parentWidth*0.15,
                                        decoration: BoxDecoration(
                                            color:advPay == 2 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WEIGHT_COLOR,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text("Cash",
                                            style: TextStyle(
                                                color:advPay == 2 ? Colors.white : Colors.black54,
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                fontFamily: 'Roboto_Regular'
                                            ),),
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.007),
                          child: Text("Delivery  Payment Will Be Given By",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: parentHeight*0.015,
                        left: parentWidth*0.05,
                        right: parentWidth*0.25
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                deliveryPay = 1;

                                if(deliverPayAmountShow == false){
                                  deliverPayAmountShow = !deliverPayAmountShow;
                                }

                              });
                            }
                          },
                          child: Row(
                            children: [

                              Container(
                                height: parentHeight*0.03,
                                width: parentWidth*0.06,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    shape: BoxShape.circle,
                                    color:deliveryPay == 1 ? CommonColor.SIGN_UP_TEXT_COLOR
                                        : CommonColor.WHITE_COLOR
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: parentWidth*0.03),
                                child: Text("Company",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontFamily: 'Roboto_Regular'
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                deliveryPay = 2;

                                if(deliverPayAmountShow == false){
                                  deliverPayAmountShow = !deliverPayAmountShow;
                                }
                              });
                            }
                          },
                          child: Row(
                            children: [

                              Container(
                                height: parentHeight*0.03,
                                width: parentWidth*0.06,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    shape: BoxShape.circle,
                                    color:deliveryPay == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                        : CommonColor.WHITE_COLOR
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: parentWidth*0.03),
                                child: Text("Receiver",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontFamily: 'Roboto_Regular'
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Visibility(
                    visible: deliverPayAmountShow,
                    child: Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.05,right: parentWidth*0.05,
                          top: parentHeight*0.015),
                      child: Container(
                        height: parentHeight*0.06,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.black12)
                        ),
                        child: Row(
                          children: [

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.03),
                              child: Icon(Icons.currency_rupee,
                                color: Colors.black,
                                size: parentHeight*0.022,),
                            ),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: parentHeight*0.01),
                                child: TextFormField(
                                  controller: quantityLoadController,
                                  // focusNode: _userNameFocus,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText:"6000",
                                    hintStyle: TextStyle(
                                      color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*6.0,
                                    ),
                                    contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05,
                                        bottom: parentHeight*0.016),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent)
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent)
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.02),
                              child: Container(
                                width: parentWidth*0.31,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: (){},
                                      onTap: (){
                                        if(mounted){
                                          setState(() {
                                            deliverPay = 1;
                                            deliveryPayMethod = "Online";
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: parentHeight*0.025,
                                        width: parentWidth*0.15,
                                        decoration: BoxDecoration(
                                            color:deliverPay == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WEIGHT_COLOR,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text("Online",
                                            style: TextStyle(
                                                color:deliverPay == 1 ? Colors.white : Colors.black54,
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                fontFamily: 'Roboto_Regular'
                                            ),),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onDoubleTap: (){},
                                      onTap: (){
                                        if(mounted){
                                          setState(() {
                                            deliverPay = 2;
                                            deliveryPayMethod = "Cash";
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: parentHeight*0.025,
                                        width: parentWidth*0.15,
                                        decoration: BoxDecoration(
                                            color:deliverPay == 2 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WEIGHT_COLOR,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text("Cash",
                                            style: TextStyle(
                                                color:deliverPay == 2 ? Colors.white : Colors.black54,
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                fontFamily: 'Roboto_Regular'
                                            ),),
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
                    ),
                  ),
                  SizedBox(
                    height: parentHeight*0.02,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: paymentFieldHide,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(right: parentWidth*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.02),
                          child: Text("Payment Details",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Medium'
                            ),),
                        ),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                paymentFieldHide = !paymentFieldHide;
                                paymentFieldShow = !paymentFieldShow;
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(Icons.edit,
                              size: parentHeight*0.025,),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: parentHeight*0.015,
                      left: parentWidth*0.05,
                      right: parentWidth*0.1,
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Fare",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                          RichText(
                            text: TextSpan(
                                text: '\u{20B9}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                  fontFamily: "Roboto_Regular"
                                ),
                                children: [
                                  TextSpan(
                                      text: ' 12000',
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: parentWidth*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
                          child: Text("Advance Payment ",
                            style: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: parentHeight*0.015,
                      left: parentWidth*0.05,
                      right: parentWidth*0.1,
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: parentWidth*0.3,
                            color:Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Company",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Regular'
                                  ),),
                                Container(
                                  height: parentHeight*0.035,
                                  width: parentWidth*0.003,
                                  color: CommonColor.UNSELECT_TYPE_COLOR,
                                ),
                                Text("Online",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Regular'
                                  ),),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: '\u{20B9}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                    fontFamily: "Roboto_Regular"
                                ),
                                children: [
                                  TextSpan(
                                      text: ' 6000',
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: parentWidth*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
                          child: Text("Delivery Payment",
                            style: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: parentHeight*0.015,
                      left: parentWidth*0.05,
                      right: parentWidth*0.1,
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: parentWidth*0.3,
                            color:Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Company",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Regular'
                                  ),),
                                Container(
                                  height: parentHeight*0.035,
                                  width: parentWidth*0.003,
                                  color: CommonColor.UNSELECT_TYPE_COLOR,
                                ),
                                Text("Cash",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Regular'
                                  ),),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: '\u{20B9}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                    fontFamily: "Roboto_Regular"
                                ),
                                children: [
                                  TextSpan(
                                      text: ' 6000',
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*4.5,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )

                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget getSubmitButton(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.05,
      left: parentWidth*0.1,
      right: parentWidth*0.1),
      child: GestureDetector(
        onDoubleTap: (){},
        onTap: (){
          // showCupertinoDialog(
          //   context: context,
          //   barrierDismissible: true,
          //   builder: (context) {
          //     return const AnimatedOpacity(
          //         opacity: 1.0,
          //         duration: Duration(seconds: 2),
          //         child: LoadPostSuccessDialog());
          //   },
          // );
        },
        child: Container(
          height: parentHeight*0.06,
          width: parentWidth*0.5,
          decoration: BoxDecoration(
            color: CommonColor.LOAD_SUBMIT_COLOR,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text("Submit",
            style: TextStyle(
              color: CommonColor.LOAD_SUBMIT_TEXT_COLOR,
              fontSize: SizeConfig.blockSizeHorizontal*5.0,
              fontFamily: 'Roboto_Bold'
            ),),
          ),
        ),
      ),
    );
  }

}
