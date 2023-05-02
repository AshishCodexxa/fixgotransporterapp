import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class BidNowPriceDialog extends StatefulWidget {

  final String isComeFrom;

  const BidNowPriceDialog({Key? key, required this.isComeFrom}) : super(key: key);

  @override
  State<BidNowPriceDialog> createState() => _BidNowPriceDialogState();
}

class _BidNowPriceDialogState extends State<BidNowPriceDialog> {


  TextEditingController vehiclePriceController = TextEditingController();
  final _vehiclePriceFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: SizeConfig.screenHeight * 0.47,
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
                    Text(widget.isComeFrom == "1" ? "Bid Now" : "Edit Price",
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
        ),
      ),
    );
  }

  Widget getSubmitButton(double parentHeight, double parentWidth){
    return  widget.isComeFrom == "1" ?
    Padding(
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
    ) :
    Padding(
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
            child: Text("Update",
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
