
import 'package:fixgotransporterapp/all_dialogs/register_success_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CompanyRegistration extends StatefulWidget {
  const CompanyRegistration({Key? key}) : super(key: key);

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {


  TextEditingController userNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController tinNumberController = TextEditingController();


  final _userNameFocus = FocusNode();
  final _companyNameFocus = FocusNode();
  final _emailIdFocus = FocusNode();
  final _companyAddressFocus = FocusNode();
  final _phoneNumberFocus = FocusNode();
  final _mobileNumberFocus = FocusNode();
  final _gstNumberFocus = FocusNode();
  final _tinNumberFocus = FocusNode();

  int addressCount = 0;
  int phoneNumberCount = 1;
  int mobileNumberCount = 1;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [


          Container(
            height: SizeConfig.screenHeight*0.12,
            color: CommonColor.APP_BAR_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.05),
                  child: Text("Registration",
                    style: TextStyle(
                        color: CommonColor.WHITE_COLOR,
                        fontSize: SizeConfig.blockSizeHorizontal*6.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto_Medium'
                    ),),
                ),
              ],
            ),
          ),

          SizedBox(
            height: SizeConfig.screenHeight*0.88,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
              children: [
                getAllFieldLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget getAllFieldLayout(double parentHeight, double parentWidth){
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.11,
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
            child:  Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: parentWidth*0.03,
                      right: parentWidth*0.03,
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    focusNode: _userNameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person,
                      color: Colors.black,),
                      label: RichText(
                        text: TextSpan(
                            text: 'User Name',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            ),
                            children: [
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      labelStyle: TextStyle(
                          color: CommonColor.REGISTER_HINT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          fontFamily: 'Roboto_Regular'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.04, top: parentHeight*0.01),
                      child: Text("( Write User Full Name )",
                        style: TextStyle(
                            color: CommonColor.REGISTER_HINT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                  ],
                ),
              ],
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
            height: parentHeight*0.09,
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
                controller: companyNameController,
                focusNode: _companyNameFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                        text: 'Transport Company Name',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
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
            height: parentHeight*0.09,
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
                controller: emailController,
                focusNode: _emailIdFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email,
                  color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Email Id',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
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
            height: parentHeight*0.11,
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
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: parentWidth*0.03,
                        ),
                        child: TextFormField(
                          controller: companyAddressController,
                          focusNode: _companyAddressFocus,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            prefixIcon: const Image(image: AssetImage("assets/images/company_location.png"),
                            color: Colors.black,),
                            label: RichText(
                              text: TextSpan(
                                  text: 'Company Address',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            labelStyle: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.03),
                      child: Container(
                        width: parentWidth*0.16,
                        height: parentHeight*0.069,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: CommonColor.REGISTER_HINT_COLOR,
                              height: parentHeight*0.06,
                              width: parentWidth*0.001,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.03),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  addressCount++;
                                  if(mounted){
                                    setState(() {

                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.add_circle_outline_rounded,
                                      color: Colors.black,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                  left: parentWidth*0.03,
                  right: parentWidth*0.03),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black38,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.04, top: parentHeight*0.01),
                      child: Text("( Can add maximum 10 company address )",
                        style: TextStyle(
                            color: CommonColor.REGISTER_HINT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        for(int i = 0; i < addressCount; i++)

        Visibility(
          visible: addressCount == 0 ? false : true,
          child: Padding(
            padding: EdgeInsets.only(
              top: parentHeight*0.02,
              left: parentWidth*0.03,
              right: parentWidth*0.03,
            ),
            child: Container(
              height: parentHeight*0.11,
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
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: parentWidth*0.03,
                          ),
                          child: TextFormField(
                            controller: companyAddressController,
                            focusNode: _companyAddressFocus,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              prefixIcon: const Image(image: AssetImage("assets/images/company_location.png"),
                                color: Colors.black,),
                              label: RichText(
                                text: TextSpan(
                                    text: 'Company Address',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                  color: CommonColor.REGISTER_HINT_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                  fontFamily: 'Roboto_Regular'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: parentWidth*0.03),
                        child: Container(
                          width: parentWidth*0.16,
                          height: parentHeight*0.069,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                height: parentHeight*0.06,
                                width: parentWidth*0.001,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: parentWidth*0.03),
                                child: GestureDetector(
                                  onDoubleTap: (){},
                                  onTap: (){
                                    addressCount--;
                                    if(mounted){
                                      setState(() {

                                      });
                                    }
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.remove_circle_outline_outlined,
                                        color: Colors.black,),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                        left: parentWidth*0.03,
                        right: parentWidth*0.03),
                    child: Container(
                      height: SizeConfig.screenWidth*0.003,
                      color: Colors.black38,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.04, top: parentHeight*0.01),
                        child: Text("( Can add maximum 10 company address )",
                          style: TextStyle(
                              color: CommonColor.REGISTER_HINT_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),
                      ),
                    ],
                  ),
                ],
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
            height: parentHeight*0.09,
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
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: parentWidth*0.03,
                        ),
                        child: TextFormField(
                          controller: phoneNumberController,
                          focusNode: _phoneNumberFocus,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            prefixIcon: const Icon(Icons.phone_android_outlined, color: Colors.black,),
                            label: RichText(
                              text: TextSpan(
                                  text: 'Land-Line No. $phoneNumberCount',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            labelStyle: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.03),
                      child: Container(
                        width: parentWidth*0.16,
                        height: parentHeight*0.067,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: CommonColor.REGISTER_HINT_COLOR,
                              height: parentHeight*0.06,
                              width: parentWidth*0.001,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.03),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  phoneNumberCount++;
                                  if(mounted){
                                    setState(() {

                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.add_circle_outline_rounded,
                                      color: Colors.black,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                      left: parentWidth*0.03,
                      right: parentWidth*0.03),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black38,
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
        ),

        for(int i = 1; i < phoneNumberCount; i++)

          Visibility(
            visible: phoneNumberCount == 1 ? false : true,
            child: Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.02,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: Container(
                height: parentHeight*0.09,
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
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: parentWidth*0.03,
                            ),
                            child: TextFormField(
                              // controller: companyAddressController,
                              // focusNode: _companyAddressFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                prefixIcon: const Icon(Icons.phone_android_outlined, color: Colors.black,),
                                label: RichText(
                                  text: TextSpan(
                                      text: 'Phone No. $phoneNumberCount',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: CommonColor.REGISTER_HINT_COLOR,
                                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                    fontFamily: 'Roboto_Regular'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.03),
                          child: Container(
                            width: parentWidth*0.16,
                            height: parentHeight*0.067,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              // border: Border(
                              //   bottom: BorderSide(width: 0.9, color: CommonColor.REGISTER_HINT_COLOR,),
                              // ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: CommonColor.REGISTER_HINT_COLOR,
                                  height: parentHeight*0.06,
                                  width: parentWidth*0.001,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: parentWidth*0.03),
                                  child: GestureDetector(
                                    onDoubleTap: (){},
                                    onTap: (){
                                      phoneNumberCount--;
                                      if(mounted){
                                        setState(() {

                                        });
                                      }
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.remove_circle_outline_rounded,
                                          color: Colors.black,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                          left: parentWidth*0.03,
                          right: parentWidth*0.03),
                      child: Container(
                        height: SizeConfig.screenWidth*0.003,
                        color: Colors.black38,
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
            ),
          ),


        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: parentWidth*0.03,
                        ),
                        child: TextFormField(
                          controller: mobileNumberController,
                          focusNode: _mobileNumberFocus,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            prefixIcon: const Icon(Icons.phone_android_outlined, color: Colors.black,),
                            label: RichText(
                              text: TextSpan(
                                  text: 'Mobile No. $mobileNumberCount',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            labelStyle: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.03),
                      child: Container(
                        width: parentWidth*0.16,
                        height: parentHeight*0.067,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          // border: Border(
                          //   bottom: BorderSide(width: 0.9, color: CommonColor.REGISTER_HINT_COLOR,),
                          // ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: CommonColor.REGISTER_HINT_COLOR,
                              height: parentHeight*0.06,
                              width: parentWidth*0.001,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.03),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  mobileNumberCount++;
                                  if(mounted){
                                    setState(() {

                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.add_circle_outline_rounded,
                                      color: Colors.black,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                      left: parentWidth*0.03,
                      right: parentWidth*0.03),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black38,
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
        ),

        for(int i = 1; i < mobileNumberCount; i++)

          Visibility(
            visible: mobileNumberCount == 1 ? false : true,
            child: Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.02,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: Container(
                height: parentHeight*0.09,
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
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: parentWidth*0.03,
                            ),
                            child: TextFormField(
                              // controller: mobileNumberController,
                              // focusNode: _mobileNumberFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                prefixIcon: const Image(image: AssetImage("assets/images/company_location.png"),
                                  color: Colors.black,),
                                label: RichText(
                                  text: TextSpan(
                                      text: 'Mobile No. $mobileNumberCount',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold))
                                      ]),
                                ),
                                labelStyle: TextStyle(
                                    color: CommonColor.REGISTER_HINT_COLOR,
                                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                    fontFamily: 'Roboto_Regular'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.03),
                          child: Container(
                            width: parentWidth*0.16,
                            height: parentHeight*0.069,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              // border: Border(
                              //   bottom: BorderSide(width: 0.9, color: CommonColor.REGISTER_HINT_COLOR,),
                              // ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: CommonColor.REGISTER_HINT_COLOR,
                                  height: parentHeight*0.06,
                                  width: parentWidth*0.001,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: parentWidth*0.03),
                                  child: GestureDetector(
                                    onDoubleTap: (){},
                                    onTap: (){
                                      mobileNumberCount--;
                                      if(mounted){
                                        setState(() {

                                        });
                                      }
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.remove_circle_outline_rounded,
                                          color: Colors.black,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                          left: parentWidth*0.03,
                          right: parentWidth*0.03),
                      child: Container(
                        height: SizeConfig.screenWidth*0.003,
                        color: Colors.black38,
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
            ),
          ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
                top: parentHeight*0.005,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: gstNumberController,
                focusNode: _gstNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person,
                  color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'GST Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                       ),
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
            height: parentHeight*0.09,
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
                top: parentHeight*0.01,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: tinNumberController,
                focusNode: _tinNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person,
                  color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Tin Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                       ),
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
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.07,
            left: SizeConfig.screenWidth*0.05,
            right: SizeConfig.screenWidth*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onDoubleTap: (){},
                onTap: (){
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return const AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(seconds: 2),
                          child: RegisterSuccessDialog());
                    },
                  );
                },
                child: Container(
                  height: SizeConfig.screenHeight*0.057,
                  width: SizeConfig.screenWidth*0.7,
                  decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Register",
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

        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.02),
          child: RichText(
            text: TextSpan(
                text: 'Already have an Account?',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.blockSizeHorizontal*3.5,
                ),
                children: [
                  TextSpan(
                      text: ' Login',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Medium'))
                ]),
          ),
        ),

        SizedBox(
          height: parentHeight*0.03,
        )

      ],
    );
  }
}
