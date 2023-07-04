
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/home_module/create_new_load_form_layout.dart';
import 'package:fixgotransporterapp/presentation/home_module/location_map.dart';
import 'package:flutter/material.dart';




class DeliveryLocationScreen extends StatefulWidget {

  final String address;
  final String lat;
  final String long;
  final String country;

  final String personName;
  final String phoneNo;
  final String addresses;
  final String citys;
  final String states;
  final String pincodes;
  final String lane;
  final String taluka;

  final String pickUpAddress;

  const DeliveryLocationScreen({Key? key,
    this.lat = '',
    this.long = '',
    this.country = '',
    this.address = '',
    this.personName = '', this.phoneNo = '',
    this.addresses = '', this.citys = '',
    this.states = '', this.pincodes = '',
    this.pickUpAddress = '', required this.lane, required this.taluka
  }) : super(key: key);

  @override
  State<DeliveryLocationScreen> createState() => _DeliveryLocationScreenState();
}

class _DeliveryLocationScreenState extends State<DeliveryLocationScreen> {


  TextEditingController receiverNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController laneNoController = TextEditingController();


  final _receiverNameFocus = FocusNode();
  final _phoneNumberFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _talukaFocus = FocusNode();
  final _laneNoFocus = FocusNode();
  final _stateFocus = FocusNode();
  final _pinCodeFocus = FocusNode();

@override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        receiverNameController =  TextEditingController(text: widget.personName);
        phoneNoController =  TextEditingController(text: widget.phoneNo);
        addressController = TextEditingController(text: widget.addresses);
        cityController = TextEditingController(text: widget.citys);
        stateController = TextEditingController(text: widget.states);
        pinCodeController = TextEditingController(text: widget.pincodes);
        laneNoController = TextEditingController(text: widget.lane);
        talukaController = TextEditingController(text: widget.taluka);
      });
    }

}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
            child: getAllPickUpPoints(SizeConfig.screenHeight, SizeConfig.screenWidth),
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
                child: const Icon(Icons.arrow_back_ios_new,
                  color: CommonColor.WHITE_COLOR,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Delivery",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }

  Widget getAllPickUpPoints(double parentHeight, double parentWidth){
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: parentHeight*0.1),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: receiverNameController,
                focusNode: _receiverNameFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                      text: 'Receiver Name',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: phoneNoController,
                focusNode: _phoneNumberFocus,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                      text: 'Phone No.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: addressController,
                focusNode: _addressFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                      text: 'Address',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: talukaController,
                focusNode: _talukaFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                      text: 'Taluka',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: laneNoController,
                focusNode: _laneNoFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                      text: 'Lane No.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: cityController,
                focusNode: _cityFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                      text: 'City',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: stateController,
                focusNode: _stateFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                      text: 'State',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.08,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: pinCodeController,
                focusNode: _pinCodeFocus,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                      text: 'Pincode',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: parentHeight*0.05),
              child: Stack(
                children: [
                  widget.address.isEmpty ?
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LocationMapScreen(comeFrom: '2',
                        personName: receiverNameController.text,
                        phoneNo: phoneNoController.text, addresses: addressController.text,
                        citys: cityController.text,
                        states: stateController.text,
                        pincodes: pinCodeController.text,
                        pickUpLocation: widget.pickUpAddress,
                        taluka: talukaController.text,
                        laneNumber: laneNoController.text,
                      )));
                    },
                    child: Container(
                      height: parentHeight*0.03,
                      width: parentWidth*0.3,
                      decoration: BoxDecoration(
                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.27),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(1, 2)),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(Icons.location_on_outlined,
                            color: Colors.white,
                            size: parentHeight*0.021,),

                          Padding(
                            padding: EdgeInsets.only(left: parentWidth*0.005),
                            child: Text("Select Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                  fontFamily: 'Ronoto_Regular',
                                  fontWeight: FontWeight.w400
                              ),),
                          )

                        ],
                      ),
                    ),
                  ) :
                  Padding(
                    padding: EdgeInsets.only(
                      left: parentWidth*0.05,
                      right: parentWidth*0.05,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LocationMapScreen(comeFrom: '2',
                          personName: receiverNameController.text,
                          phoneNo: phoneNoController.text, addresses: addressController.text,
                          citys: cityController.text,
                          states: stateController.text,
                          pincodes: pinCodeController.text,
                          pickUpLocation: widget.pickUpAddress,
                          taluka: talukaController.text,
                          laneNumber: laneNoController.text,
                        )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on_outlined,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.02,
                                  top: parentHeight*0.01,
                                  bottom: parentHeight*0.01),
                              child: Container(
                                  color: Colors.transparent,
                                  width: parentWidth*0.7,
                                  child: Text(widget.address)
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
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.05,
            left: SizeConfig.screenWidth*0.05,
            right: SizeConfig.screenWidth*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){

                  if(receiverNameController.text.isEmpty && phoneNoController.text.isEmpty && addressController.text.isEmpty &&
                      cityController.text.isEmpty && stateController.text.isEmpty && pinCodeController.text.isEmpty){
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("All Fields Are Required")));
                  }else if(widget.lat.isEmpty){
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Please Select Location on Map")));
                  }else if(phoneNoController.text.length != 10){
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Please Enter valid Phone Number")));
                  }
                  else{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewLoadScreenForm(
                      deliveryAddress: widget.address,
                      pickUpAddress: widget.pickUpAddress,
                      reciverName: receiverNameController.text,
                      reciverPhone: phoneNoController.text,
                      street: addressController.text,
                      city: cityController.text,
                      postalCode: pinCodeController.text,
                      lat: widget.lat,
                      long: widget.long,
                      state: stateController.text,
                      country: "India",
                      lane: laneNoController.text,
                      taluka: talukaController.text,
                    )));
                  }


                },
                child: Container(
                  height: SizeConfig.screenHeight*0.05,
                  width: SizeConfig.screenWidth*0.7,
                  decoration: BoxDecoration(
                      color: widget.long.isEmpty ? CommonColor.LOAD_SUBMIT_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Submit",
                      style: TextStyle(
                          color: CommonColor.WHITE_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*5.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Medium'
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}