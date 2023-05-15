
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/profile_module/edit_profile_screen.dart';
import 'package:fixgotransporterapp/presentation/profile_module/my_wallet_screen.dart';
import 'package:fixgotransporterapp/presentation/profile_module/notifications_screen.dart';
import 'package:fixgotransporterapp/presentation/profile_module/transaction_history_parent_screen.dart';
import 'package:flutter/material.dart';



class ProfileChildScreen extends StatefulWidget {

  final ProfileChildScreenListener mListener;

  const ProfileChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<ProfileChildScreen> createState() => _ProfileChildScreenState();
}

class _ProfileChildScreenState extends State<ProfileChildScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.06),
        children: [

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
              left: SizeConfig.screenWidth*0.05,
              right: SizeConfig.screenWidth*0.05,),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(3, 6)),
                  ],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                        left: SizeConfig.screenWidth*0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: Text("User Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular',
                                fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                fontWeight: FontWeight.w500
                            ),),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
                          child: Text("Email Id",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular',
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w400
                            ),),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
                          child: Container(
                            color: Colors.transparent,
                            width: SizeConfig.screenWidth*0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Phone No.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto_Regular',
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontWeight: FontWeight.w400
                                  ),),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                                  },
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Icon(Icons.edit)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: SizeConfig.screenHeight*0.02,
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          getAllProfileField(SizeConfig.screenHeight, SizeConfig.screenWidth)

        ],
      ),
    );
  }

  Widget getAllProfileField(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(
        top: parentHeight*0.02,
        left: parentWidth*0.05,
        right: parentWidth*0.05,),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(3, 6)),
            ],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: EdgeInsets.only(top: parentHeight*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight*0.005,
                    left: parentWidth*0.05),
                child: GestureDetector(
                  
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWalletScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.037,
                          width: SizeConfig.screenWidth*0.08,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Text("My Wallet",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular',
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.012,
                    bottom: SizeConfig.screenHeight*0.01),
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
                padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight*0.005,
                    left: parentWidth*0.05),
                child: GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>BankAccountDetailsScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.037,
                          width: SizeConfig.screenWidth*0.08,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Text("Bank Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular',
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.012,
                    bottom: SizeConfig.screenHeight*0.01),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005,
                    left: parentWidth*0.05),
                child: GestureDetector(
                  
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.037,
                          width: SizeConfig.screenWidth*0.08,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Text("Notification",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular',
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.012,
                    left: parentWidth*0.05),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionHistoryScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight*0.037,
                          width: SizeConfig.screenWidth*0.08,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.03),
                          child: Text("Transaction History",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular',
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.012),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013,
                    left: parentWidth*0.05),
                child: Row(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight*0.037,
                      width: SizeConfig.screenWidth*0.08,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.03),
                      child: Text("About Us",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto_Regular',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013,
                    left: parentWidth*0.05),
                child: Row(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight*0.037,
                      width: SizeConfig.screenWidth*0.08,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.03),
                      child: Text("Privacy Policy",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto_Regular',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013,
                    left: parentWidth*0.05),
                child: Row(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight*0.037,
                      width: SizeConfig.screenWidth*0.08,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.03),
                      child: Text("Terms & Condition",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto_Regular',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013,
                    left: parentWidth*0.05),
                child: Row(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight*0.037,
                      width: SizeConfig.screenWidth*0.08,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.03),
                      child: Text("Cancellation Policy",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto_Regular',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013),
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
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.013,
                    left: parentWidth*0.05),
                child: Row(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight*0.037,
                      width: SizeConfig.screenWidth*0.08,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.03),
                      child: Text("Logout",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto_Regular',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: parentHeight*0.02,
              )

            ],
          ),
        ),
      ),
    );
  }
}


abstract class ProfileChildScreenListener{

}
