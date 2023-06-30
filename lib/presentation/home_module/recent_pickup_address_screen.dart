
import 'package:fixgotransporterapp/all_dialogs/post_delete_confirm_dialog.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/data/data_constant/constant_data.dart';
import 'package:fixgotransporterapp/data/dio_client.dart';
import 'package:fixgotransporterapp/data/model/get_all_pickup_address_response_model.dart';
import 'package:fixgotransporterapp/presentation/home_module/create_new_load_form_layout.dart';
import 'package:fixgotransporterapp/presentation/home_module/pick_up_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';





class PreviousAddressListScreen extends StatefulWidget {
  const PreviousAddressListScreen({Key? key}) : super(key: key);

  @override
  State<PreviousAddressListScreen> createState() => _PreviousAddressListScreenState();
}

class _PreviousAddressListScreenState extends State<PreviousAddressListScreen> {


  int selectedIndex = -1;

  final items = <Docs>[];

  bool isLoading = false;

  String pickUpAddress = '';

  @override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        isLoading = true;
      });
    }

    refresh();
  }

  refresh(){
    ApiClient().getAllPickUpAddressList().then((value) {

      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

      var jsonList = GetAllPickUpAddressList.fromJson(value);

      items.addAll(jsonList.data.docs);

      print(items.length);

      if(mounted){
        setState(() {});
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: CommonColor.WHITE_COLOR,
                height: SizeConfig.safeUsedHeight * .88,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: <Widget>[

                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Padding(
                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                                child: Container(
                                  height: SizeConfig.screenHeight*0.05,
                                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                                        child: Text("Select Pick-up Address",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Roboto_Regular'
                                          ),),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: items.length,
                                  (context, index) {
                                return  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                                      right: SizeConfig.screenWidth*0.05,
                                      top: SizeConfig.screenHeight*0.01),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          selectedIndex = index;
                                          setState(() {

                                            pickUpAddress = "${items[index].address.street}, ${items[index].address.city}, ${items[index].address.district}, ${items[index].address.laneNumber}, ${items[index].address.state}, ${items[index].address.country}, ${items[index].address.postalCode}";

                                            GetStorage().write(ConstantData.pickupAddressId, items[index].id);

                                          });
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      child: const Icon(Icons.circle_outlined,
                                                        color: CommonColor.BLACK_COLOR,),
                                                    ),
                                                    Visibility(
                                                      visible: selectedIndex == index,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.0027),
                                                        child: Icon(Icons.circle,
                                                          color: CommonColor.BLACK_COLOR,
                                                          size: SizeConfig.blockSizeHorizontal*3.0,),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03, top: SizeConfig.screenHeight*0.01),
                                                child: Container(
                                                  width: SizeConfig.screenWidth*0.73,
                                                  color: Colors.transparent,
                                                  child: Text("${items[index].address.street}, ${items[index].address.district}, ${items[index].address.laneNumber}, ${items[index].address.city}, ${items[index].address.state}, ${items[index].address.country}, ${items[index].address.postalCode}",
                                                      style: TextStyle(
                                                        color: CommonColor.BLACK_COLOR,
                                                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                                        fontFamily: 'Roboto_Medium',
                                                        fontWeight: FontWeight.w400,
                                                      )
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                var result = showGeneralDialog(
                                                      barrierColor: Colors.black.withOpacity(0.5),
                                                      transitionBuilder: (context, a1, a2, widget) {
                                                        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
                                                        // return Transform(
                                                        //   transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                                                        return Transform.scale(
                                                          scale: a1.value,
                                                          child: Opacity(
                                                            opacity: a1.value,
                                                            child: PostDeleteConfirmationDialog(
                                                              message: "Are You Sure,\nYou Want To Delete a Address",
                                                              postId: items[index].id, openFrom: "1",
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      transitionDuration: const Duration(milliseconds: 200),
                                                      barrierDismissible: true,
                                                      barrierLabel: '',
                                                      context: context,
                                                      pageBuilder: (context, animation2, animation1) {
                                                        return Container();
                                                      });

                                                },
                                                child: Container(
                                                    color: Colors.transparent,
                                                    child: const Icon(
                                                        Icons.delete_forever
                                                    )
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                                        child: Container(
                                          height: SizeConfig.screenWidth*0.003,
                                          color: Colors.black12,
                                          child: const Row(
                                            children: [
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
                                  padding: EdgeInsets.only(top: items.isNotEmpty ? SizeConfig.screenHeight*0.03 : SizeConfig.screenHeight*0.3,
                                      left: SizeConfig.screenWidth*0.3,
                                      right: SizeConfig.screenWidth*0.3),
                                  child: GestureDetector(
                                    onDoubleTap: (){},
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PickUpLocation(lane: '', taluka: '',)));
                                    },
                                    child: Container(
                                      height: SizeConfig.screenHeight*0.04,
                                      decoration: BoxDecoration(
                                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.4),
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                              offset: const Offset(1, 1)),
                                        ],
                                        // border: Border.all(color: Colors.black)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Icon(Icons.add,
                                            color: Colors.white,
                                            size: SizeConfig.screenHeight*0.025,),

                                          Padding(
                                            padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.005),
                                            child: Text("Add New Address",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig.blockSizeHorizontal*3.3,
                                                  fontFamily: 'Ronoto_Regular',
                                                  fontWeight: FontWeight.w400
                                              ),),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05,
                        left: SizeConfig.screenWidth*0.05,
                        right: SizeConfig.screenWidth*0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              selectedIndex != -1 ?
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewLoadScreenForm(pickUpAddress: pickUpAddress,)))
                                  : Container();
                            },
                            child: Container(
                              height: SizeConfig.screenHeight*0.05,
                              width: SizeConfig.screenWidth*0.7,
                              decoration: BoxDecoration(
                                  color:selectedIndex == -1 ? CommonColor.LOAD_SUBMIT_COLOR : CommonColor.SIGN_UP_TEXT_COLOR,
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.5),
                child: Visibility(
                    visible: isLoading,
                    child: Image(
                      image: const AssetImage("assets/images/grid_loading.gif"),
                      height: SizeConfig.screenHeight*.1,
                      width: SizeConfig.screenWidth*.1,
                    )
                ),
              ),
            ],
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
                child: const Icon(Icons.arrow_back_ios_new,
                  color: CommonColor.WHITE_COLOR,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Transporter",
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
}