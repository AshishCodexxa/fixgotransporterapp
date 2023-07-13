
import 'package:fixgotransporterapp/all_dialogs/register_success_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/data/data_constant/constant_data.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/login_registration/kyc_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';




class TransporterDetailsScreen extends StatefulWidget {
  const TransporterDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TransporterDetailsScreen> createState() => _TransporterDetailsScreenState();
}

class _TransporterDetailsScreenState extends State<TransporterDetailsScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController transporterNameController = TextEditingController();
  TextEditingController transporterLocationController = TextEditingController();

  final _userNameFocus = FocusNode();
  final _transporterNameFocus = FocusNode();
  final _transporterLocationFocus = FocusNode();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        isLoading = true;
      });
    }

    ApiClient().getUserProfileData().then((value){

      GetStorage().write(ConstantData.userName, value['data']['name']);
      GetStorage().write(ConstantData.companyName, value['data']['companyName']);
      GetStorage().write(ConstantData.companyAddress, value['data']['companyAddress']);

      userNameController.text = value['data']['name'];
      transporterNameController.text = value['data']['companyName'];
      transporterLocationController.text = value['data']['companyAddress'];

      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
          Visibility(
            visible: isLoading,
              child: const CircularProgressIndicator()
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
                controller: transporterNameController,
                focusNode: _transporterNameFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                        text: 'Transporter Company Name',
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
                controller: transporterLocationController,
                focusNode: _transporterLocationFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company_location.png"),),
                  label: RichText(
                    text: TextSpan(
                        text: 'Transporter Location',
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
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.07,
            left: SizeConfig.screenWidth*0.05,
            right: SizeConfig.screenWidth*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  if(mounted){
                    setState(() {
                      isLoading = true;
                    });
                  }

                  ApiClient().editUserProfileData(
                      userNameController.text,
                      transporterNameController.text,
                      '',
                      transporterLocationController.text,
                      [],
                      [],
                      '',
                      '',
                      '',
                      '',
                      isLoading
                  ).then((value){

                    if(mounted){
                      setState(() {
                        isLoading = false;
                      });
                    }


                    ApiClient().getUserProfileData().then((value) {
                      if (value.isEmpty) return;

                      GetStorage().write(ConstantData.userName, value['data']['name']);
                      GetStorage().write(ConstantData.companyName, value['data']['companyName']);
                      GetStorage().write(ConstantData.companyAddress, value['data']['companyAddress']);

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const KYCVerifyScreen()));

                    });


                  });

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

        SizedBox(
          height: parentHeight*0.03,
        )

      ],
    );
  }
}
