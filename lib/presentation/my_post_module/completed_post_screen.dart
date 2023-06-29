
import 'package:fixgotransporterapp/all_dialogs/cash_pay_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/company_verify_details_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/filter_vehicle_owner_list_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgotransporterapp/all_dialogs/vehicle_amount_pay_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/draw_dash_border_class.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/interested_vehicle_owner_list.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/vehicle_owner_info_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CompletedPostScreen extends StatefulWidget {
  const CompletedPostScreen({Key? key}) : super(key: key);

  @override
  State<CompletedPostScreen> createState() => _CompletedPostScreenState();
}

class _CompletedPostScreenState extends State<CompletedPostScreen> {



  bool vehicleDetailsHide = true;
  bool arrowShow = true;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [

          Container(
            height: SizeConfig.screenHeight*0.8,
            color: Colors.transparent,
            child:  ListView.builder(
                itemCount: 1,
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.02),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                            left: SizeConfig.screenWidth*0.03,
                            right: SizeConfig.screenWidth*0.03),
                        child: Container(
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
                          child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                        ),
                      ),

                      /*Container(
                        height: SizeConfig.screenHeight*0.49,
                        child: CustomScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  getTransporterListHeading(SizeConfig.screenHeight, SizeConfig.screenWidth)
                                ],
                              ),
                            ),

                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: 3,
                                      (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: SizeConfig.screenHeight*0.02,
                                            left: SizeConfig.screenWidth*0.05,
                                            right: SizeConfig.screenWidth*0.05,
                                          ),
                                          child: GestureDetector(
                                            
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleOwnerInfoProfile()));
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Text("Nikita Vehicle Owner",
                                                        style: TextStyle(
                                                            color: CommonColor.BLACK_COLOR,
                                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'Roboto_Regular'
                                                        ),),

                                                      RichText(
                                                        text: TextSpan(
                                                            text: '\u{20B9}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                  text: ' 2000/-',
                                                                  style: TextStyle(
                                                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.w400))
                                                            ]),
                                                      ),

                                                    ],
                                                  ),

                                                  Padding(
                                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("Pune",
                                                          style: TextStyle(
                                                              color: CommonColor.BLACK_COLOR,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                              fontWeight: FontWeight.w500,
                                                              fontFamily: 'Roboto_Regular'
                                                          ),),
                                                      ],
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("Vehicle Available on : 1 Feb 23",
                                                          style: TextStyle(
                                                              color: CommonColor.BLACK_COLOR,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                                              fontWeight: FontWeight.w500,
                                                              fontFamily: 'Roboto_Regular'
                                                          ),),
                                                      ],
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.002),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: SizeConfig.screenWidth*0.11,
                                                              height: SizeConfig.screenHeight*0.023,
                                                              decoration: BoxDecoration(
                                                                color: CommonColor.SELECT_TYPE_COLOR,
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [

                                                                  Padding(
                                                                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                                                    child: Text("4.5",
                                                                      style: TextStyle(
                                                                          color: CommonColor.WHITE_COLOR,
                                                                          fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontFamily: 'Roboto_Medium'
                                                                      ),),
                                                                  ),

                                                                  Padding(
                                                                    padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.017),
                                                                    child: Icon(Icons.star,
                                                                      size: SizeConfig.blockSizeHorizontal*2.5,
                                                                      color: Colors.white,),
                                                                  )

                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                                              child: Text(
                                                                "No. of Vehicle : 04",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                                                    fontFamily: "Roboto_Regular",
                                                                    fontWeight: FontWeight.w400
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),



                                                        GestureDetector(
                                                          
                                                          onTap: (){
                                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDetailsScreen()));
                                                          },
                                                          child: Container(
                                                            width: SizeConfig.screenWidth*0.18,
                                                            height: SizeConfig.screenHeight*0.03,
                                                            decoration: BoxDecoration(
                                                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                                                              borderRadius: BorderRadius.circular(7),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [

                                                                Text("Book Now",
                                                                  style: TextStyle(
                                                                      color: CommonColor.WHITE_COLOR,
                                                                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                                      fontWeight: FontWeight.w500,
                                                                      fontFamily: 'Roboto_Medium'
                                                                  ),),

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
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
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
                                    );
                                  },
                                )
                            ),


                            SliverPadding(
                              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.15),
                              sliver: SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,),
                                      child: GestureDetector(
                                        
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InterestedVehicleOwnerList()));
                                        },
                                        child: Container(
                                          width: SizeConfig.screenWidth*0.21,
                                          height: SizeConfig.screenHeight*0.05,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text("View All",
                                                style: TextStyle(
                                                    color: CommonColor.BLACK_COLOR,
                                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Roboto_Medium'
                                                ),),

                                            ],
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
                      )*/

                    ],
                  );
                }
            ),


          ),

        ],
      ),
    );
  }


  Widget getTransporterListHeading(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(
        top: parentHeight*0.025,
        left: parentWidth*0.05,
        right: parentWidth*0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("Interested Vehicle Owner List",
            style: TextStyle(
                color: CommonColor.BLACK_COLOR,
                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto_Medium'
            ),),

          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  elevation: 20,
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                  builder: (BuildContext bc) {
                    return const VehicleOwnerListFilter();
                  });
            },
            child: Container(
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Image(image: AssetImage("assets/images/filter_icon.png")),
                )
            ),
          )

        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.012,),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: parentHeight*0.01,
                          width: parentWidth*0.021,
                          decoration: const BoxDecoration(
                              color: CommonColor.FROM_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                          child: Container(
                            width: parentWidth*0.5,
                            color: Colors.transparent,
                            child: Text(
                              "City Avenue, Wakad",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: parentHeight*0.013,
                            width: parentWidth*0.003,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [

                        Container(
                          height: parentHeight*0.01,
                          width: parentWidth*0.021,
                          decoration: const BoxDecoration(
                              color: CommonColor.TO_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Container(
                            width: parentWidth*0.5,
                            color: Colors.transparent,
                            child: Text(
                              "Pune Station",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: parentWidth*0.05,),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '\u{20B9}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal*3.7,
                          ),
                          children: [
                            TextSpan(
                                text: ' 2000/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.001),
                      child: Row(
                        children: [
                          Text("(Transport Fare)",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*2.0,
                                height: parentHeight*0.002
                            ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Post on 26th Jan 2023 | 10:30 am",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: parentWidth * 0.05,
                    top: parentHeight * 0.01),
                child: Container(
                  width: parentWidth * 0.17,
                  height: parentHeight * 0.023,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: CommonColor.FROM_AREA_COLOR),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Completed",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                            fontFamily: "Roboto_Medium",
                            fontWeight: FontWeight.w500,
                            color: CommonColor.FROM_AREA_COLOR
                        ),),
                    ),
                  ),
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Pick-up Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.005),
                      child: Row(
                        children: [
                          Text(
                            "28 Jan 2023",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Pick-up Time",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.005),
                      child: Row(
                        children: [
                          Text(
                            "02:00 pm",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Bid End Date",
                          style: TextStyle(
                              color: Colors.transparent,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.007,
                          left: parentWidth*0.03),
                      child:GestureDetector(
                        
                        onTap: (){
                          showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return const AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: Duration(seconds: 2),
                                  child: LoadMoreInfoDialog(isComeFrom: '', postDetails: [], postIndex: 0,));
                            },
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            "More",
                            style: TextStyle(
                                color: CommonColor.SIGN_UP_TEXT_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                fontFamily: "Roboto_Regular ",
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015,
                left: parentWidth*0.012),
            child: CustomPaint(painter: DrawDottedhorizontalline()),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
                top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Qty Of Load : ',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              ),
                              children: [
                                TextSpan(
                                    text: '10 Ton(s)',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto_Regular'))
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: parentHeight*0.01),
                          child: Text(
                            "No. of Vehicle : 04",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.01),
                      child: Row(
                        children: [
                          Container(
                            width: parentWidth*0.45,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Adv. - 1000/- (Online)",
                                  style: TextStyle(
                                    color: CommonColor.FROM_AREA_COLOR,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                  ),),
                                Text("Due. - 1000/- ",
                                  style: TextStyle(
                                    color: CommonColor.TO_AREA_COLOR,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*2.5,
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
                  padding: EdgeInsets.only(right: parentWidth*0.05,),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
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
                                  child: const CompanyVerifyDialog(companyId: '',),
                                );
                              });
                        },
                        child: Container(
                          height: parentHeight*0.025,
                          width: parentWidth*0.16,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black26,)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: parentWidth*0.01,
                                right: parentWidth*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Codexxa",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto_Medium',
                                    fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                  ),)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.screenWidth*0.03,
                            top: parentHeight*0.01
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              
                              onTap: (){

                                showCupertinoDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return const AnimatedOpacity(
                                        opacity: 1.0,
                                        duration: Duration(seconds: 2),
                                        child: VehicleCashAmountPayDialog());
                                  },
                                );



                              },
                              child: Container(
                                height: SizeConfig.screenHeight*0.025,
                                width: SizeConfig.screenWidth*0.15,
                                decoration: BoxDecoration(
                                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Center(
                                  child: Text("Pay",
                                    style: TextStyle(
                                        color: CommonColor.WHITE_COLOR,
                                        fontSize: SizeConfig.blockSizeHorizontal*2.7,
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
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
                right: parentWidth*0.05,
                top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(mounted){
                          setState(() {
                            vehicleDetailsHide = !vehicleDetailsHide;
                            arrowShow = !arrowShow;
                          });
                        }
                      },
                      child: Text("Vehicle Details",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.7,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ),
                    Stack(
                      children: [
                        Visibility(
                          visible: arrowShow,
                          child: GestureDetector(
                            
                            onTap: (){
                              if(mounted){
                                setState(() {
                                  vehicleDetailsHide = !vehicleDetailsHide;
                                  arrowShow = !arrowShow;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !arrowShow,
                          child: GestureDetector(
                            onTap: (){
                              if(mounted){
                                setState(() {
                                  vehicleDetailsHide = !vehicleDetailsHide;
                                  arrowShow = !arrowShow;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Icon(Icons.keyboard_arrow_up_outlined,
                                color: Colors.black,),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),


          for(int i = 0; i < 3; i++)

            Visibility(
              visible: !vehicleDetailsHide,
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth*0.05,
                    right: parentWidth*0.05,
                    top: parentHeight*0.01),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.02,
                            top: parentHeight*0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Column(
                              children: [
                                Container(
                                  height: parentHeight*0.085,
                                  width: parentWidth*0.2,
                                  decoration: BoxDecoration(
                                      color: CommonColor.VEHICLE_DRIVER_IMG_COLOR,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                Text("MH12 NT3456",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium',
                                      height: parentHeight*0.002
                                  ),),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: parentWidth*0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: parentWidth*0.54,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          width: parentWidth*0.35,
                                          child: Text("Raj Vehicle",
                                            style: TextStyle(
                                                color: CommonColor.BLACK_COLOR,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto_Medium'
                                            ),),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            Padding(
                                              padding: EdgeInsets.only(right: parentWidth*0.02),
                                              child: Text("Rs. 2000",
                                                style: TextStyle(
                                                    color: CommonColor.BLACK_COLOR,
                                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Roboto_Medium'
                                                ),),
                                            ),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.005),
                                    child: Container(
                                      color: Colors.transparent,
                                      width: parentWidth*0.55,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Type Of Vehicle",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto_Medium'
                                            ),),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: SizeConfig.screenWidth*0.03,
                                              top: parentHeight*0.0
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  
                                                  onTap: (){

                                                    showCupertinoDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (context) {
                                                        return const AnimatedOpacity(
                                                            opacity: 1.0,
                                                            duration: Duration(seconds: 2),
                                                            child: VehicleAmountPayDialog(isComeFrom: '3',));
                                                      },
                                                    );



                                                  },
                                                  child: Container(
                                                    height: SizeConfig.screenHeight*0.021,
                                                    width: SizeConfig.screenWidth*0.15,
                                                    decoration: BoxDecoration(
                                                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                                                        borderRadius: BorderRadius.circular(3)
                                                    ),
                                                    child: Center(
                                                      child: Text("Pay In Cash",
                                                        style: TextStyle(
                                                            color: CommonColor.WHITE_COLOR,
                                                            fontSize: SizeConfig.blockSizeHorizontal*2.0,
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
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.005),
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Pack Body',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                          children: [
                                            TextSpan(
                                                text: '  (LxW: 40x08 ft)',
                                                style: TextStyle(
                                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Roboto_Regular'))
                                          ]),
                                    ),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.01),
                                    child: Container(
                                      color: Colors.transparent,
                                      width: parentWidth*0.53,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "Mobile No.",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                        fontFamily: "Roboto_Regular",
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(top: parentHeight*0.007),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "8965247632",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig.blockSizeHorizontal*3.1,
                                                          fontFamily: "Roboto_Regular",
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "RLW Kgs",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                        fontFamily: "Roboto_Regular",
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(top: parentHeight*0.007),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "1550Kg",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig.blockSizeHorizontal*3.1,
                                                          fontFamily: "Roboto_Regular",
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "Driver Assign",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                                        fontFamily: "Roboto_Regular",
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(top: parentHeight*0.007),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: parentWidth*0.17,
                                                      child: Center(
                                                        child: Text(
                                                          "Vinay",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: SizeConfig.blockSizeHorizontal*3.1,
                                                              fontFamily: "Roboto_Regular",
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: parentHeight*0.01),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Adv. - 1000/- (Online)",
                                                style: TextStyle(
                                                  color: CommonColor.FROM_AREA_COLOR,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                                ),),
                                              Padding(
                                                padding: EdgeInsets.only(left: parentWidth*0.03),
                                                child: Text("Due. - 1000/- ",
                                                  style: TextStyle(
                                                    color: CommonColor.TO_AREA_COLOR,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                                  ),),
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

                          ],
                        ),
                      ),

                      SizedBox(
                        height: parentHeight*0.01,
                      )

                    ],
                  ),
                ),
              ),
            ),

          SizedBox(
            height: parentHeight*0.02,
          )

        ],
      ),
    );
  }
}


