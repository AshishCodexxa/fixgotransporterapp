
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/dashboard/dashboard_screen.dart';
import 'package:fixgotransporterapp/data/data_constant/constant_data.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  // final phoneNumberController = <TextEditingController>[];

  List<TextEditingController> phoneNumberController = [];
  List<TextEditingController> mobileNumberController = [];


  TextEditingController mobileNumberControllers = TextEditingController();
  TextEditingController phoneNumberControllers = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController tinNumberController = TextEditingController();
  TextEditingController aadhaarNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();

  final _userNameFocus = FocusNode();
  final _companyNameFocus = FocusNode();
  final _emailIdFocus = FocusNode();
  final _companyAddressFocus = FocusNode();
  final _gstNumberFocus = FocusNode();
  final _tinNumberFocus = FocusNode();
  final _aadhaarNumberFocus = FocusNode();
  final _panNumberFocus = FocusNode();

  int addressCount = 0;
  int phoneNumberCount = 1;
  int mobileNumberCount = 1;

  List landlineNumber = [];
  List mobileNumber = [];

  int mobileIndex = 0;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        isLoading = true;
      });
    }


    ApiClient().getUserProfileData().then((value) {
      if (value.isEmpty) return;

      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

      GetStorage().write(ConstantData.userId, value['data']['_id']);
      GetStorage().write(ConstantData.userName, value['data']['name']);
      GetStorage().write(ConstantData.emailId, value['data']['email']);
      GetStorage().write(ConstantData.contactNo, value['data']['phone']);

      userNameController.text = value['data']['name'];
      companyNameController.text = value['data']['companyName'];
      emailController.text = value['data']['email'] ?? "";
      // companyAddressController.text = value['data']['companyName'];
      landlineNumber = value['data']['landlines'];
      mobileNumber = value['data']['mobiles'];
      // print("landlineNumber $landlineNumber");
      // print("mobileNumber $mobileNumber");

      if(mounted){
        setState(() {
          for(int index = 0; index < landlineNumber.length ; index++){


            // phoneNumberController.add(TextEditingController());
            //
            // phoneNumberController[index].text = landlineNumber[index].toString();
            //
            // print(phoneNumberController[index].text);

            phoneNumberControllers.text = landlineNumber[index].toString();


          }
        });
      }

      if(mounted){
        setState(() {

          for(int index = 0; index < mobileNumber.length ; index++) {
            /*mobileNumberController.add(TextEditingController());

            mobileNumberController[index].text = mobileNumber[index].toString();

            print(mobileNumberController[index].text);*/
            mobileNumberControllers.text = mobileNumber[index].toString();
          }
        });
      }

      mobileNumber = value['data']['mobiles'];
      gstNumberController.text = value['data']['gstNumber'];
      tinNumberController.text = value['data']['tinNumber'];
      aadhaarNumberController.text = value['data']['aadharIDNumber'];
      panNumberController.text = value['data']['panNumber'];
      companyAddressController.text = value['data']['companyAddress'];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
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
                child: getAllEditAccount(
                    SizeConfig.screenHeight, SizeConfig.screenWidth),
              ),
            ],
          ),
          Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator()
          ),
        ],
      ),
    );
  }

  Widget getTopText(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * 0.05,
          left: parentWidth * 0.035,
          right: parentWidth * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: CommonColor.WHITE_COLOR,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text(
              "Edit Account",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.5,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR),
            ),
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }

  Widget getAllEditAccount(double parentHeight, double parentWidth) {
    return    ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.11,
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: parentWidth * 0.03,
                    right: parentWidth * 0.03,
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    focusNode: _userNameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: RichText(
                        text: TextSpan(
                            text: 'User Name',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            ),
                            children: const []),
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
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.04, top: parentHeight * 0.01),
                      child: Text(
                        "( Write User Full Name )",
                        style: TextStyle(
                            color: CommonColor.REGISTER_HINT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
                top: parentHeight * 0.0,
                left: parentWidth * 0.03,
                right: parentWidth * 0.03,
              ),
              child: TextFormField(
                controller: companyNameController,
                focusNode: _companyNameFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(
                    image: AssetImage("assets/images/company.png"),
                  ),
                  label: RichText(
                    text: TextSpan(
                        text: 'Company Name',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                        children: const []),
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
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
                top: parentHeight * 0.0,
                left: parentWidth * 0.03,
                right: parentWidth * 0.03,
              ),
              child: TextFormField(
                controller: emailController,
                focusNode: _emailIdFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  label: RichText(
                    text: TextSpan(
                        text: 'Email Id',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        ),
                        children: const []),
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
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
            child: Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: parentWidth * 0.03,
                    ),
                    child: TextFormField(
                      controller: companyAddressController,
                      focusNode: _companyAddressFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                        prefixIcon: const Image(
                          image: AssetImage(
                              "assets/images/company_location.png"),
                          color: Colors.black,
                        ),
                        label: RichText(
                          text: TextSpan(
                              text: 'Company Address',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                SizeConfig.blockSizeHorizontal * 3.5,
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal *
                                            4.0,
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
                  padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.0,
                      left: parentWidth * 0.03,
                      right: parentWidth * 0.03),
                  child: Container(
                    height: SizeConfig.screenWidth * 0.003,
                    color: Colors.black38,
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
              ],
            ),
          ),
        ),


        // for(int i = 0; i < phoneNumberController.length; i++)
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: parentWidth * 0.03,
                        ),
                        child: TextFormField(
                          controller: phoneNumberControllers/*[i]*/,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.black,
                            ),
                            label: RichText(
                              text: TextSpan(
                                  text: 'LandLine No.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal * 3.5,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontSize: SizeConfig
                                                .blockSizeHorizontal *
                                                4.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            labelStyle: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize:
                                SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        ),
                      ),
                    ),
                    /* Padding(
                        padding: EdgeInsets.only(right: parentWidth * 0.03),
                        child: Container(
                          width: parentWidth * 0.16,
                          height: parentHeight * 0.067,
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
                                height: parentHeight * 0.06,
                                width: parentWidth * 0.001,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: parentWidth * 0.03),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: i == 0
                                        ? GestureDetector(
                                            onTap: () {
                                              if (phoneNumberController.length != 3) {
                                                phoneNumberController.length++;
                                                if (mounted) {
                                                  setState(() {
                                                    phoneNumberController[i+1].clear();
                                                  });
                                                }
                                              }
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: const Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              // phoneNumberController.length--;

                                              phoneNumberController.removeAt(i);
                                              if (mounted) {
                                                setState(() {});
                                              }
                                              // print(phoneNumberController.length);
                                              // print(phoneNumberController[i].text);
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: const Icon(
                                                Icons
                                                    .remove_circle_outline_rounded,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )*/
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.0,
                      left: parentWidth * 0.03,
                      right: parentWidth * 0.03),
                  child: Container(
                    height: SizeConfig.screenWidth * 0.003,
                    color: Colors.black38,
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
              ],
            ),
          ),
        ),



        // for (int i = 0;
        // i < mobileNumberController.length;
        // i++)
        Padding(
          padding: EdgeInsets.only(
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: parentWidth * 0.03,
                        ),
                        child: TextFormField(
                          controller: mobileNumberControllers,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.black,
                            ),
                            label: RichText(
                              text: TextSpan(
                                  text: 'Mobile No.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal * 3.5,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontSize: SizeConfig
                                                .blockSizeHorizontal *
                                                4.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            labelStyle: TextStyle(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                fontSize:
                                SizeConfig.blockSizeHorizontal * 3.5,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        ),
                      ),
                    ),
                    /*Padding(
                        padding: EdgeInsets.only(right: parentWidth * 0.03),
                        child: Container(
                          width: parentWidth * 0.16,
                          height: parentHeight * 0.067,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                height: parentHeight * 0.06,
                                width: parentWidth * 0.001,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(right: parentWidth * 0.03),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: i == 0
                                        ? GestureDetector(
                                      onTap: () {
                                        if (mobileNumberController.length != 3) {
                                          mobileNumberController.length++;
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: const Icon(
                                          Icons
                                              .add_circle_outline_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                        : GestureDetector(
                                      onTap: () {
                                        mobileNumberController.length--;
                                        if (mounted) {
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: const Icon(
                                          Icons
                                              .remove_circle_outline_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )*/
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.0,
                      left: parentWidth * 0.03,
                      right: parentWidth * 0.03),
                  child: Container(
                    height: SizeConfig.screenWidth * 0.003,
                    color: Colors.black38,
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
              ],
            ),
          ),
        ),



        Padding(
          padding: EdgeInsets.only(
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
                top: parentHeight * 0.005,
                left: parentWidth * 0.03,
                right: parentWidth * 0.03,
              ),
              child: TextFormField(
                controller: gstNumberController,
                focusNode: _gstNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: RichText(
                    text: TextSpan(
                      text: 'GST Number',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
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
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
                top: parentHeight * 0.01,
                left: parentWidth * 0.03,
                right: parentWidth * 0.03,
              ),
              child: TextFormField(
                controller: tinNumberController,
                focusNode: _tinNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: RichText(
                    text: TextSpan(
                      text: 'Tin Number',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
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
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
                top: parentHeight * 0.005,
                left: parentWidth * 0.03,
                right: parentWidth * 0.03,
              ),
              child: TextFormField(
                controller: aadhaarNumberController,
                focusNode: _aadhaarNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: RichText(
                    text: TextSpan(
                      text: 'Aadhaar Number',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
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
            top: parentHeight * 0.02,
            left: parentWidth * 0.03,
            right: parentWidth * 0.03,
          ),
          child: Container(
            height: parentHeight * 0.09,
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
                top: parentHeight * 0.01,
                left: parentWidth * 0.03,
                right: parentWidth * 0.03,
              ),
              child: TextFormField(
                controller: panNumberController,
                focusNode: _panNumberFocus,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: RichText(
                    text: TextSpan(
                      text: 'Pan Number',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
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
            top: SizeConfig.screenHeight * 0.05,
            left: SizeConfig.screenWidth * 0.05,
            right: SizeConfig.screenWidth * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {

                  if(mounted){
                    setState(() {
                      isLoading = true;
                    });
                  }

                  landlineNumber.add(phoneNumberControllers.text);
                  mobileNumber.add(mobileNumberControllers.text);

                  ApiClient().editUserProfileData(
                      userNameController.text,
                      companyNameController.text,
                      emailController.text,
                      companyAddressController.text,
                      landlineNumber,
                      mobileNumber,
                      gstNumberController.text,
                      tinNumberController.text,
                      aadhaarNumberController.text,
                      panNumberController.text,
                      isLoading
                  ).then((value){
                    if(mounted){
                      setState(() {
                        isLoading = false;

                      });
                    }

                    // Navigator.pop(context);

                    ApiClient().getUserProfileData().then((value) {
                      if (value.isEmpty) return;


                      GetStorage().write(ConstantData.userId, value['data']['_id']);
                      GetStorage().write(ConstantData.userName, value['data']['name']);
                      GetStorage().write(ConstantData.emailId, value['data']['email']);
                      GetStorage().write(ConstantData.contactNo, value['data']['phone']);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard(isComeFrom: "1",)));


                    });


                  });
                },
                child: Container(
                  height: SizeConfig.screenHeight * 0.057,
                  width: SizeConfig.screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                          color: CommonColor.WHITE_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Medium'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );




    // return CustomScrollView(
    //   slivers: <Widget>[
    //
    //     SliverList(
    //       delegate: SliverChildListDelegate(
    //         [
    //           Padding(
    //             padding: EdgeInsets.only(
    //               top: parentHeight * 0.02,
    //               left: parentWidth * 0.03,
    //               right: parentWidth * 0.03,
    //             ),
    //             child: Container(
    //               height: parentHeight * 0.11,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                       color: Colors.black.withOpacity(0.1),
    //                       blurRadius: 5,
    //                       spreadRadius: 1,
    //                       offset: const Offset(2, 6)),
    //                 ],
    //               ),
    //               child: Column(
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(
    //                       left: parentWidth * 0.03,
    //                       right: parentWidth * 0.03,
    //                     ),
    //                     child: TextFormField(
    //                       controller: userNameController,
    //                       focusNode: _userNameFocus,
    //                       textInputAction: TextInputAction.next,
    //                       decoration: InputDecoration(
    //                         prefixIcon: const Icon(
    //                           Icons.person,
    //                           color: Colors.black,
    //                         ),
    //                         label: RichText(
    //                           text: TextSpan(
    //                               text: 'User Name',
    //                               style: TextStyle(
    //                                 color: Colors.black54,
    //                                 fontWeight: FontWeight.w400,
    //                                 fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                               ),
    //                               children: const []),
    //                         ),
    //                         labelStyle: TextStyle(
    //                             color: CommonColor.REGISTER_HINT_COLOR,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                             fontFamily: 'Roboto_Regular'),
    //                       ),
    //                     ),
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(
    //                             left: parentWidth * 0.04, top: parentHeight * 0.01),
    //                         child: Text(
    //                           "( Write User Full Name )",
    //                           style: TextStyle(
    //                               color: CommonColor.REGISTER_HINT_COLOR,
    //                               fontSize: SizeConfig.blockSizeHorizontal * 3.0,
    //                               fontWeight: FontWeight.w500,
    //                               fontFamily: 'Roboto_Regular'),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(
    //               top: parentHeight * 0.02,
    //               left: parentWidth * 0.03,
    //               right: parentWidth * 0.03,
    //             ),
    //             child: Container(
    //               height: parentHeight * 0.09,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                       color: Colors.black.withOpacity(0.1),
    //                       blurRadius: 5,
    //                       spreadRadius: 1,
    //                       offset: const Offset(2, 6)),
    //                 ],
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.only(
    //                   top: parentHeight * 0.0,
    //                   left: parentWidth * 0.03,
    //                   right: parentWidth * 0.03,
    //                 ),
    //                 child: TextFormField(
    //                   controller: companyNameController,
    //                   focusNode: _companyNameFocus,
    //                   textInputAction: TextInputAction.next,
    //                   decoration: InputDecoration(
    //                     prefixIcon: const Image(
    //                       image: AssetImage("assets/images/company.png"),
    //                     ),
    //                     label: RichText(
    //                       text: TextSpan(
    //                           text: 'Company Name',
    //                           style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           ),
    //                           children: const []),
    //                     ),
    //                     labelStyle: TextStyle(
    //                         color: CommonColor.REGISTER_HINT_COLOR,
    //                         fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                         fontFamily: 'Roboto_Regular'),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(
    //               top: parentHeight * 0.02,
    //               left: parentWidth * 0.03,
    //               right: parentWidth * 0.03,
    //             ),
    //             child: Container(
    //               height: parentHeight * 0.09,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                       color: Colors.black.withOpacity(0.1),
    //                       blurRadius: 5,
    //                       spreadRadius: 1,
    //                       offset: const Offset(2, 6)),
    //                 ],
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.only(
    //                   top: parentHeight * 0.0,
    //                   left: parentWidth * 0.03,
    //                   right: parentWidth * 0.03,
    //                 ),
    //                 child: TextFormField(
    //                   controller: emailController,
    //                   focusNode: _emailIdFocus,
    //                   textInputAction: TextInputAction.next,
    //                   decoration: InputDecoration(
    //                     prefixIcon: const Icon(
    //                       Icons.email,
    //                       color: Colors.black,
    //                     ),
    //                     label: RichText(
    //                       text: TextSpan(
    //                           text: 'Email Id',
    //                           style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           ),
    //                           children: const []),
    //                     ),
    //                     labelStyle: TextStyle(
    //                         color: CommonColor.REGISTER_HINT_COLOR,
    //                         fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                         fontFamily: 'Roboto_Regular'),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //
    //           Padding(
    //             padding: EdgeInsets.only(
    //               top: parentHeight * 0.02,
    //               left: parentWidth * 0.03,
    //               right: parentWidth * 0.03,
    //             ),
    //             child: Container(
    //               height: parentHeight * 0.09,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                       color: Colors.black.withOpacity(0.1),
    //                       blurRadius: 5,
    //                       spreadRadius: 1,
    //                       offset: const Offset(2, 6)),
    //                 ],
    //               ),
    //               child: Column(
    //                 children: [
    //                   Flexible(
    //                     child: Padding(
    //                       padding: EdgeInsets.only(
    //                         left: parentWidth * 0.03,
    //                       ),
    //                       child: TextFormField(
    //                         controller: companyAddressController,
    //                         focusNode: _companyAddressFocus,
    //                         textInputAction: TextInputAction.next,
    //                         decoration: InputDecoration(
    //                           enabledBorder: const UnderlineInputBorder(
    //                               borderSide: BorderSide.none),
    //                           focusedBorder: const UnderlineInputBorder(
    //                               borderSide: BorderSide.none),
    //                           prefixIcon: const Image(
    //                             image: AssetImage(
    //                                 "assets/images/company_location.png"),
    //                             color: Colors.black,
    //                           ),
    //                           label: RichText(
    //                             text: TextSpan(
    //                                 text: 'Company Address',
    //                                 style: TextStyle(
    //                                   color: Colors.black54,
    //                                   fontWeight: FontWeight.w400,
    //                                   fontSize:
    //                                   SizeConfig.blockSizeHorizontal * 3.5,
    //                                 ),
    //                                 children: [
    //                                   TextSpan(
    //                                       text: '*',
    //                                       style: TextStyle(
    //                                           fontSize:
    //                                           SizeConfig.blockSizeHorizontal *
    //                                               4.0,
    //                                           color: Colors.red,
    //                                           fontWeight: FontWeight.bold))
    //                                 ]),
    //                           ),
    //                           labelStyle: TextStyle(
    //                               color: CommonColor.REGISTER_HINT_COLOR,
    //                               fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                               fontFamily: 'Roboto_Regular'),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.only(
    //                         top: SizeConfig.screenHeight * 0.0,
    //                         left: parentWidth * 0.03,
    //                         right: parentWidth * 0.03),
    //                     child: Container(
    //                       height: SizeConfig.screenWidth * 0.003,
    //                       color: Colors.black38,
    //                       child: Row(
    //                         children: const [
    //                           Text(
    //                             "hii",
    //                             style: TextStyle(color: Colors.transparent),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //
    //
    //
    //     SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           childCount: landlineNumber.length,
    //               (context, index) {
    //             return Padding(
    //               padding: EdgeInsets.only(
    //                 top: parentHeight * 0.02,
    //                 left: parentWidth * 0.03,
    //                 right: parentWidth * 0.03,
    //               ),
    //               child: Container(
    //                 height: parentHeight * 0.09,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(15),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 5,
    //                         spreadRadius: 1,
    //                         offset: const Offset(2, 6)),
    //                   ],
    //                 ),
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Flexible(
    //                           child: Padding(
    //                             padding: EdgeInsets.only(
    //                               left: parentWidth * 0.03,
    //                             ),
    //                             child: TextFormField(
    //                               controller: phoneNumberController[index],
    //                               textInputAction: TextInputAction.next,
    //                               decoration: InputDecoration(
    //                                 enabledBorder: const UnderlineInputBorder(
    //                                     borderSide: BorderSide.none),
    //                                 focusedBorder: const UnderlineInputBorder(
    //                                     borderSide: BorderSide.none),
    //                                 prefixIcon: const Icon(
    //                                   Icons.phone_android_outlined,
    //                                   color: Colors.black,
    //                                 ),
    //                                 label: RichText(
    //                                   text: TextSpan(
    //                                       text: 'LandLine No. $index',
    //                                       style: TextStyle(
    //                                         color: Colors.black54,
    //                                         fontWeight: FontWeight.w400,
    //                                         fontSize:
    //                                         SizeConfig.blockSizeHorizontal * 3.5,
    //                                       ),
    //                                       children: [
    //                                         TextSpan(
    //                                             text: '*',
    //                                             style: TextStyle(
    //                                                 fontSize: SizeConfig
    //                                                     .blockSizeHorizontal *
    //                                                     4.0,
    //                                                 color: Colors.red,
    //                                                 fontWeight: FontWeight.bold))
    //                                       ]),
    //                                 ),
    //                                 labelStyle: TextStyle(
    //                                     color: CommonColor.REGISTER_HINT_COLOR,
    //                                     fontSize:
    //                                     SizeConfig.blockSizeHorizontal * 3.5,
    //                                     fontFamily: 'Roboto_Regular'),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding: EdgeInsets.only(right: parentWidth * 0.03),
    //                           child: Container(
    //                             width: parentWidth * 0.16,
    //                             height: parentHeight * 0.067,
    //                             decoration: const BoxDecoration(
    //                               color: Colors.transparent,
    //                               // border: Border(
    //                               //   bottom: BorderSide(width: 0.9, color: CommonColor.REGISTER_HINT_COLOR,),
    //                               // ),
    //                             ),
    //                             child: Row(
    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Container(
    //                                   color: CommonColor.REGISTER_HINT_COLOR,
    //                                   height: parentHeight * 0.06,
    //                                   width: parentWidth * 0.001,
    //                                 ),
    //                                 Padding(
    //                                   padding:
    //                                   EdgeInsets.only(right: parentWidth * 0.03),
    //                                   child: Container(
    //                                     color: Colors.transparent,
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.all(8.0),
    //                                       child: index == 0
    //                                           ? GestureDetector(
    //                                         onTap: () {
    //                                           if (landlineNumber.length != 3) {
    //                                             landlineNumber.length++;
    //                                             if (mounted) {
    //                                               setState(() {});
    //                                             }
    //                                           }
    //                                         },
    //                                         child: Container(
    //                                           color: Colors.transparent,
    //                                           child: const Icon(
    //                                             Icons
    //                                                 .add_circle_outline_rounded,
    //                                             color: Colors.black,
    //                                           ),
    //                                         ),
    //                                       )
    //                                           : GestureDetector(
    //                                         onTap: () {
    //                                           landlineNumber.length--;
    //                                           if (mounted) {
    //                                             setState(() {});
    //                                           }
    //                                         },
    //                                         child: Container(
    //                                           color: Colors.transparent,
    //                                           child: const Icon(
    //                                             Icons
    //                                                 .remove_circle_outline_rounded,
    //                                             color: Colors.black,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.only(
    //                           top: SizeConfig.screenHeight * 0.0,
    //                           left: parentWidth * 0.03,
    //                           right: parentWidth * 0.03),
    //                       child: Container(
    //                         height: SizeConfig.screenWidth * 0.003,
    //                         color: Colors.black38,
    //                         child: Row(
    //                           children: const [
    //                             Text(
    //                               "hii",
    //                               style: TextStyle(color: Colors.transparent),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         )
    //     ),
    //
    //
    //     SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           childCount: 3,
    //               (context, index) {
    //             return Padding(
    //               padding: EdgeInsets.only(
    //                 top: parentHeight * 0.02,
    //                 left: parentWidth * 0.03,
    //                 right: parentWidth * 0.03,
    //               ),
    //               child: Container(
    //                 height: parentHeight * 0.09,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(15),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 5,
    //                         spreadRadius: 1,
    //                         offset: const Offset(2, 6)),
    //                   ],
    //                 ),
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Flexible(
    //                           child: Padding(
    //                             padding: EdgeInsets.only(
    //                               left: parentWidth * 0.03,
    //                             ),
    //                             child: TextFormField(
    //                               textInputAction: TextInputAction.next,
    //                               decoration: InputDecoration(
    //                                 enabledBorder: const UnderlineInputBorder(
    //                                     borderSide: BorderSide.none),
    //                                 focusedBorder: const UnderlineInputBorder(
    //                                     borderSide: BorderSide.none),
    //                                 prefixIcon: const Icon(
    //                                   Icons.phone_android_outlined,
    //                                   color: Colors.black,
    //                                 ),
    //                                 label: RichText(
    //                                   text: TextSpan(
    //                                       text: 'Mobile No. $i',
    //                                       style: TextStyle(
    //                                         color: Colors.black54,
    //                                         fontWeight: FontWeight.w400,
    //                                         fontSize:
    //                                         SizeConfig.blockSizeHorizontal * 3.5,
    //                                       ),
    //                                       children: [
    //                                         TextSpan(
    //                                             text: '*',
    //                                             style: TextStyle(
    //                                                 fontSize: SizeConfig
    //                                                     .blockSizeHorizontal *
    //                                                     4.0,
    //                                                 color: Colors.red,
    //                                                 fontWeight: FontWeight.bold))
    //                                       ]),
    //                                 ),
    //                                 labelStyle: TextStyle(
    //                                     color: CommonColor.REGISTER_HINT_COLOR,
    //                                     fontSize:
    //                                     SizeConfig.blockSizeHorizontal * 3.5,
    //                                     fontFamily: 'Roboto_Regular'),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding: EdgeInsets.only(right: parentWidth * 0.03),
    //                           child: Container(
    //                             width: parentWidth * 0.16,
    //                             height: parentHeight * 0.067,
    //                             decoration: const BoxDecoration(
    //                               color: Colors.transparent,
    //                             ),
    //                             child: Row(
    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Container(
    //                                   color: CommonColor.REGISTER_HINT_COLOR,
    //                                   height: parentHeight * 0.06,
    //                                   width: parentWidth * 0.001,
    //                                 ),
    //                                 Padding(
    //                                   padding:
    //                                   EdgeInsets.only(right: parentWidth * 0.03),
    //                                   child: Container(
    //                                     color: Colors.transparent,
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.all(8.0),
    //                                       child: i == 1
    //                                           ? GestureDetector(
    //                                         onTap: () {
    //                                           if (mobileNumber.length != 3) {
    //                                             mobileNumber.length++;
    //                                             if (mounted) {
    //                                               setState(() {});
    //                                             }
    //                                           }
    //                                         },
    //                                         child: Container(
    //                                           color: Colors.transparent,
    //                                           child: const Icon(
    //                                             Icons
    //                                                 .add_circle_outline_rounded,
    //                                             color: Colors.black,
    //                                           ),
    //                                         ),
    //                                       )
    //                                           : GestureDetector(
    //                                         onTap: () {
    //                                           mobileNumber.length--;
    //                                           if (mounted) {
    //                                             setState(() {});
    //                                           }
    //                                         },
    //                                         child: Container(
    //                                           color: Colors.transparent,
    //                                           child: const Icon(
    //                                             Icons
    //                                                 .remove_circle_outline_rounded,
    //                                             color: Colors.black,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.only(
    //                           top: SizeConfig.screenHeight * 0.0,
    //                           left: parentWidth * 0.03,
    //                           right: parentWidth * 0.03),
    //                       child: Container(
    //                         height: SizeConfig.screenWidth * 0.003,
    //                         color: Colors.black38,
    //                         child: Row(
    //                           children: const [
    //                             Text(
    //                               "hii",
    //                               style: TextStyle(color: Colors.transparent),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         )
    //     ),
    //
    //     SliverPadding(
    //       padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.15),
    //       sliver: SliverList(
    //         delegate: SliverChildListDelegate(
    //           [
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 top: parentHeight * 0.02,
    //                 left: parentWidth * 0.03,
    //                 right: parentWidth * 0.03,
    //               ),
    //               child: Container(
    //                 height: parentHeight * 0.09,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(15),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 5,
    //                         spreadRadius: 1,
    //                         offset: const Offset(2, 6)),
    //                   ],
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                     top: parentHeight * 0.005,
    //                     left: parentWidth * 0.03,
    //                     right: parentWidth * 0.03,
    //                   ),
    //                   child: TextFormField(
    //                     controller: gstNumberController,
    //                     focusNode: _gstNumberFocus,
    //                     textInputAction: TextInputAction.next,
    //                     decoration: InputDecoration(
    //                       prefixIcon: const Icon(
    //                         Icons.person,
    //                         color: Colors.black,
    //                       ),
    //                       label: RichText(
    //                         text: TextSpan(
    //                           text: 'GST Number',
    //                           style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           ),
    //                         ),
    //                       ),
    //                       labelStyle: TextStyle(
    //                           color: CommonColor.REGISTER_HINT_COLOR,
    //                           fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           fontFamily: 'Roboto_Regular'),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 top: parentHeight * 0.02,
    //                 left: parentWidth * 0.03,
    //                 right: parentWidth * 0.03,
    //               ),
    //               child: Container(
    //                 height: parentHeight * 0.09,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(15),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 5,
    //                         spreadRadius: 1,
    //                         offset: const Offset(2, 6)),
    //                   ],
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                     top: parentHeight * 0.01,
    //                     left: parentWidth * 0.03,
    //                     right: parentWidth * 0.03,
    //                   ),
    //                   child: TextFormField(
    //                     controller: tinNumberController,
    //                     focusNode: _tinNumberFocus,
    //                     textInputAction: TextInputAction.next,
    //                     decoration: InputDecoration(
    //                       prefixIcon: const Icon(
    //                         Icons.person,
    //                         color: Colors.black,
    //                       ),
    //                       label: RichText(
    //                         text: TextSpan(
    //                           text: 'Tin Number',
    //                           style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           ),
    //                         ),
    //                       ),
    //                       labelStyle: TextStyle(
    //                           color: CommonColor.REGISTER_HINT_COLOR,
    //                           fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           fontFamily: 'Roboto_Regular'),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 top: parentHeight * 0.02,
    //                 left: parentWidth * 0.03,
    //                 right: parentWidth * 0.03,
    //               ),
    //               child: Container(
    //                 height: parentHeight * 0.09,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(15),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 5,
    //                         spreadRadius: 1,
    //                         offset: const Offset(2, 6)),
    //                   ],
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                     top: parentHeight * 0.005,
    //                     left: parentWidth * 0.03,
    //                     right: parentWidth * 0.03,
    //                   ),
    //                   child: TextFormField(
    //                     controller: aadhaarNumberController,
    //                     focusNode: _aadhaarNumberFocus,
    //                     textInputAction: TextInputAction.next,
    //                     decoration: InputDecoration(
    //                       prefixIcon: const Icon(
    //                         Icons.person,
    //                         color: Colors.black,
    //                       ),
    //                       label: RichText(
    //                         text: TextSpan(
    //                           text: 'Aadhaar Number',
    //                           style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           ),
    //                         ),
    //                       ),
    //                       labelStyle: TextStyle(
    //                           color: CommonColor.REGISTER_HINT_COLOR,
    //                           fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           fontFamily: 'Roboto_Regular'),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 top: parentHeight * 0.02,
    //                 left: parentWidth * 0.03,
    //                 right: parentWidth * 0.03,
    //               ),
    //               child: Container(
    //                 height: parentHeight * 0.09,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(15),
    //                   boxShadow: <BoxShadow>[
    //                     BoxShadow(
    //                         color: Colors.black.withOpacity(0.1),
    //                         blurRadius: 5,
    //                         spreadRadius: 1,
    //                         offset: const Offset(2, 6)),
    //                   ],
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                     top: parentHeight * 0.01,
    //                     left: parentWidth * 0.03,
    //                     right: parentWidth * 0.03,
    //                   ),
    //                   child: TextFormField(
    //                     controller: panNumberController,
    //                     focusNode: _panNumberFocus,
    //                     textInputAction: TextInputAction.done,
    //                     decoration: InputDecoration(
    //                       prefixIcon: const Icon(
    //                         Icons.person,
    //                         color: Colors.black,
    //                       ),
    //                       label: RichText(
    //                         text: TextSpan(
    //                           text: 'Pan Number',
    //                           style: TextStyle(
    //                             color: Colors.black54,
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           ),
    //                         ),
    //                       ),
    //                       labelStyle: TextStyle(
    //                           color: CommonColor.REGISTER_HINT_COLOR,
    //                           fontSize: SizeConfig.blockSizeHorizontal * 3.5,
    //                           fontFamily: 'Roboto_Regular'),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 top: SizeConfig.screenHeight * 0.05,
    //                 left: SizeConfig.screenWidth * 0.05,
    //                 right: SizeConfig.screenWidth * 0.05,
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   GestureDetector(
    //                     onDoubleTap: () {},
    //                     onTap: () {},
    //                     child: Container(
    //                       height: SizeConfig.screenHeight * 0.057,
    //                       width: SizeConfig.screenWidth * 0.7,
    //                       decoration: BoxDecoration(
    //                           color: CommonColor.SIGN_UP_TEXT_COLOR,
    //                           borderRadius: BorderRadius.circular(10)),
    //                       child: Center(
    //                         child: Text(
    //                           "Update",
    //                           style: TextStyle(
    //                               color: CommonColor.WHITE_COLOR,
    //                               fontSize: SizeConfig.blockSizeHorizontal * 5.0,
    //                               fontWeight: FontWeight.w500,
    //                               fontFamily: 'Roboto_Medium'),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //
    //   ],
    // );


  }
}
