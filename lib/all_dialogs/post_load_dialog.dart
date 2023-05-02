import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';




class PostLoadDialog extends StatefulWidget {
  const PostLoadDialog({Key? key}) : super(key: key);

  @override
  State<PostLoadDialog> createState() => _PostLoadDialogState();
}

class _PostLoadDialogState extends State<PostLoadDialog> {



  TextEditingController vehiclePriceController = TextEditingController();
  final _vehiclePriceFocus = FocusNode();

  bool advPayAmountShow = false;
  bool deliverPayAmountShow = false;

  bool paymentFieldShow = true;
  bool paymentFieldHide = false;

  int advancePay = 0;
  int deliveryPay = 0;

  int advPay = 0;
  String advPayMethod = "";

  int deliverPay = 0;
  String deliveryPayMethod = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: SizeConfig.screenHeight * 0.7,
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          child: Column(
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
                    Text("Post Load",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto_Medium',
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeHorizontal*4.5
                      ),),
                    Padding(
                      padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.05),
                      child: GestureDetector(
                        onDoubleTap: (){},
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

                                  Text("XYZ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto_Regular',
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*4.0
                                    ),),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("10 Tonne(s)",
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

                              Text("Requirement : Open Body",
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
                                    Text("City Avenue, Wakad > Pune Station",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight*0.02,
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)
                        ),
                        prefixIcon: Icon(Icons.currency_rupee,
                          size: SizeConfig.screenHeight*0.025,
                          color: Colors.black,),
                        label: RichText(
                          text: TextSpan(
                              text: 'Price Per Vehicle',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, top: SizeConfig.screenHeight*0.007),
                    child: Text("Advance Payment",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Regular'
                      ),),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.03,
                        top: SizeConfig.screenHeight*0.01),
                    child: Row(
                      children: [

                        Container(
                          height: SizeConfig.screenHeight*0.027,
                          width: SizeConfig.screenWidth*0.07,
                          decoration: BoxDecoration(
                              color: CommonColor.ADVANCE_INCREMENT_COLOR,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.remove,
                            color: Colors.white,
                            size: SizeConfig.screenHeight*0.02,),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02, right: SizeConfig.screenWidth*0.02),
                          child: Text("50 %",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),

                        Container(
                          height: SizeConfig.screenHeight*0.027,
                          width: SizeConfig.screenWidth*0.07,
                          decoration: BoxDecoration(
                              color: CommonColor.ADVANCE_INCREMENT_COLOR,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.add,
                            color: Colors.white,
                            size: SizeConfig.screenHeight*0.02,),
                        ),

                      ],
                    ),
                  ),

                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,right: SizeConfig.screenWidth*0.05,
                    top: SizeConfig.screenHeight*0.02),
                child: Container(
                  height: SizeConfig.screenHeight*0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.black12)
                  ),
                  child: Row(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                        child: Icon(Icons.currency_rupee,
                          color: Colors.black,
                          size: SizeConfig.screenHeight*0.022,),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: TextFormField(
                            // controller: quantityLoadController,
                            // focusNode: _userNameFocus,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText:"6000",
                              hintStyle: TextStyle(
                                color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*6.0,
                              ),
                              contentPadding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, right: SizeConfig.screenWidth*0.05,
                                  bottom: SizeConfig.screenHeight*0.016),
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
                        padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.02),
                        child: Container(
                          width: SizeConfig.screenWidth*0.31,
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
                                  height: SizeConfig.screenHeight*0.025,
                                  width: SizeConfig.screenWidth*0.15,
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
                                  height: SizeConfig.screenHeight*0.025,
                                  width: SizeConfig.screenWidth*0.15,
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
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, top: SizeConfig.screenHeight*0.007),
                      child: Text("Delivery Payment",
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
                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,right: SizeConfig.screenWidth*0.05,
                    top: SizeConfig.screenHeight*0.015),
                child: Container(
                  height: SizeConfig.screenHeight*0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.black12)
                  ),
                  child: Row(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                        child: Icon(Icons.currency_rupee,
                          color: Colors.black,
                          size: SizeConfig.screenHeight*0.022,),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: TextFormField(
                            // controller: quantityLoadController,
                            // focusNode: _userNameFocus,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText:"6000",
                              hintStyle: TextStyle(
                                color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*6.0,
                              ),
                              contentPadding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, right: SizeConfig.screenWidth*0.05,
                                  bottom: SizeConfig.screenHeight*0.016),
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
                        padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.02),
                        child: Container(
                          width: SizeConfig.screenWidth*0.31,
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
                                  height: SizeConfig.screenHeight*0.025,
                                  width: SizeConfig.screenWidth*0.15,
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
                                  height: SizeConfig.screenHeight*0.025,
                                  width: SizeConfig.screenWidth*0.15,
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
              getSubmitButton(SizeConfig.screenHeight, SizeConfig.screenWidth),

            ],
          ),
        ),
      ),
    );
  }


  Widget getAmountLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.02),
      child: Column(
        children: [

        ],
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
          height: parentHeight*0.055,
          width: parentWidth*0.75,
          decoration: BoxDecoration(
              color: CommonColor.LOAD_SUBMIT_COLOR,
              borderRadius: BorderRadius.circular(10)
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