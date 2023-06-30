import 'dart:async';

import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/dashboard/dashboard_screen.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/data/model/get_all_company_post_response_model.dart';
import 'package:flutter/material.dart';


class BidNowPriceDialog extends StatefulWidget {

  final String isComeFrom;
  final int mainPrice;
  final int bidAmount;
  final List <Datum>postDetails;
  final int postIndex;
  final String companyName;

  const BidNowPriceDialog({Key? key, required this.isComeFrom, required this.mainPrice, required this.bidAmount, required this.postDetails, required this.postIndex, required this.companyName}) : super(key: key);

  @override
  State<BidNowPriceDialog> createState() => _BidNowPriceDialogState();
}

class _BidNowPriceDialogState extends State<BidNowPriceDialog> {


  TextEditingController vehiclePriceController = TextEditingController();
  final _vehiclePriceFocus = FocusNode();

  String pickUpLocation = "";
  String finalLocation = "";

  String bidMessage = "";

  int? bidAmountDialog;

  int selectAmount = -1;

  startTimer() {
    var durtaion = new Duration(seconds: 2);
    return Timer(durtaion, dialogHide);
  }

  void dialogHide() {
    if(mounted){
      setState(() {
        bidAmountDialog = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

/*    int main = widget.mainPrice;

    print(widget.mainPrice);
    int remain = 0;
    List tt = [];

    for(int i = 0; i < 4; i++){
      if(remain == 0){
        remain = main;
        tt.add(remain);
        print(tt);
      }else{
        remain = remain - 500;
        tt.add(remain);
        print(tt);
      }

    }*/

    pickUpLocation = "${widget.postDetails[widget.postIndex].pickup?.address?.street}, ${widget.postDetails[widget.postIndex].pickup?.address?.city}, ${widget.postDetails[widget.postIndex].pickup?.address?.district}, ${widget.postDetails[widget.postIndex].pickup?.address?.laneNumber}, ${widget.postDetails[widget.postIndex].pickup?.address?.state}, ${widget.postDetails[widget.postIndex].pickup?.address?.country}, ${widget.postDetails[widget.postIndex].pickup?.address?.postalCode}";

    finalLocation = "${widget.postDetails[widget.postIndex].receiver?.address?.street}, ${widget.postDetails[widget.postIndex].receiver?.address?.city}, ${widget.postDetails[widget.postIndex].pickup?.address?.district}, ${widget.postDetails[widget.postIndex].pickup?.address?.laneNumber}, ${widget.postDetails[widget.postIndex].receiver?.address?.state}, ${widget.postDetails[widget.postIndex].receiver?.address?.country}, ${widget.postDetails[widget.postIndex].receiver?.address?.postalCode}";


    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: SizeConfig.screenHeight * 0.5,
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight*0.05,
                    decoration: const BoxDecoration(
                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
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
                        Text(widget.bidAmount == 0 ? "Bid Now" : "Edit Price",
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

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.1,
                        right: SizeConfig.screenWidth*0.1,
                        top: SizeConfig.screenHeight*0.03),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)
                      ),
                      child:  Padding(
                        padding:  EdgeInsets.only(top: SizeConfig.screenHeight*0.015,
                            bottom: SizeConfig.screenHeight*0.015),
                        child: Column(
                          children: [
                            Row(
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                                      left: SizeConfig.screenWidth*0.05),
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.04,
                                    width: SizeConfig.screenWidth*0.09,
                                    decoration: BoxDecoration(
                                      color: CommonColor.TRANSPORTER_PROFILE_COLOR,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                                      left: SizeConfig.screenWidth*0.04),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Container(
                                        width: SizeConfig.screenWidth*0.6,
                                        child: Text(widget.companyName,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto_Regular',
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0
                                          ),),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${widget.postDetails[widget.postIndex].loadDetail?.load} ${widget.postDetails[widget.postIndex].loadDetail?.loadUnit}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto_Regular',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig.blockSizeHorizontal*3.0
                                              ),),

                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                )

                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: SizeConfig.screenWidth*0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(widget.postDetails[widget.postIndex].vehicle?.vehicleType != "Trailor" ?
                                  "Requirement : ${widget.postDetails[widget.postIndex].vehicle?.vehicleType}"
                                    : "Requirement : ${widget.postDetails[widget.postIndex].vehicle?.vehicleType} (${widget.postDetails[widget.postIndex].vehicle?.vehicleType})",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto_Regular',
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.5
                                    ),),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: SizeConfig.screenWidth*0.7,
                                          child: Text("$pickUpLocation. ---> $finalLocation.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto_Regular',
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.0
                                            ),),
                                        ),

                                      ],
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



                  /*Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                    child: Container(
                      height: SizeConfig.screenHeight*0.07,
                      color: Colors.transparent,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[

                            for(int i = 0; i < tt.length; i++)
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03,
                                  left: SizeConfig.screenWidth*0.012,
                                  right: SizeConfig.screenWidth*0.012),
                              child: GestureDetector(
                                onTap: (){
                                  if(mounted){
                                    setState(() {

                                      if(selectAmount != tt[i]){
                                        selectAmount = tt[i];
                                        vehiclePriceController.text = tt[i].toString();
                                      }else{
                                        selectAmount = -1;
                                        vehiclePriceController.clear();
                                      }

                                    });
                                  }
                                },
                                child: Container(
                                  height: SizeConfig.screenHeight*0.035,
                                  width: SizeConfig.screenWidth*0.2,
                                  decoration: BoxDecoration(
                                      color: selectAmount == tt[i] ? CommonColor.SIGN_UP_TEXT_COLOR : Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Center(
                                    child: Text("${tt[i]}",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                          fontFamily: "Roboto_Medium",
                                          fontWeight: FontWeight.w500,
                                          color: CommonColor.BLACK_COLOR
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),*/


                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight*0.03,
                      left: SizeConfig.screenWidth*0.03,
                      right: SizeConfig.screenWidth*0.03,
                    ),
                    child: Container(
                      height: SizeConfig.screenHeight*0.08,
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth*0.03,
                          right: SizeConfig.screenWidth*0.03,
                        ),
                        child: TextFormField(
                          controller: vehiclePriceController,
                          focusNode: _vehiclePriceFocus,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45)
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45)
                            ),
                            prefixIcon: Icon(Icons.currency_rupee,
                            size: SizeConfig.screenHeight*0.03,
                            color: Colors.black,),
                            label: RichText(
                              text: TextSpan(
                                  text: 'Vehicle Price',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),
                                  children: [

                                  ]),
                            ),
                            labelStyle: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: 'Roboto_Regular'),
                          ),
                          style: TextStyle(
                              color: CommonColor.BLACK_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                              fontFamily: 'Roboto_Medium'),
                        ),
                      ),
                    ),
                  ),

                  getSubmitButton(SizeConfig.screenHeight, SizeConfig.screenWidth)

                ],
              ),
              Visibility(
                visible: bidAmountDialog == 1 ? true : false,
                child: Container(
                  height: SizeConfig.screenHeight*0.06,
                  width: SizeConfig.screenWidth*0.5,
                  decoration: BoxDecoration(
                    color: CommonColor.SIGN_UP_TEXT_COLOR.withOpacity(0.94),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(bidMessage,
                    style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal*3.7,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto_Medium'
                    ),textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSubmitButton(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.05,
          left: parentWidth*0.1,
          right: parentWidth*0.1),
      child: GestureDetector(
        onTap: (){

          ApiClient().uploadBidAgainstPost(widget.postDetails[widget.postIndex].id, vehiclePriceController.text).then((value){
            print(value['data']);

            if(mounted){
              setState(() {

                if(value['data'] == null){
                  if(mounted){
                    setState(() {
                      bidMessage = value['message'];
                      bidAmountDialog = 1;
                      startTimer();
                    });
                  }
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(isComeFrom: '2',)));
                }

              });
            }

          });

        },
        child: Container(
          height: parentHeight*0.055,
          width: parentWidth*0.75,
          decoration: BoxDecoration(
              color: vehiclePriceController.text.isEmpty ? CommonColor.LOAD_SUBMIT_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(widget.bidAmount == 0 ? "Add Bid" : "Update Bid",
              style: TextStyle(
                  color:vehiclePriceController.text.isEmpty ? CommonColor.LOAD_SUBMIT_TEXT_COLOR : CommonColor.WHITE_COLOR,
                  fontSize: SizeConfig.blockSizeHorizontal*5.0,
                  fontFamily: 'Roboto_Bold'
              ),),
          ),
        ),
      ),
    );
  }
}
