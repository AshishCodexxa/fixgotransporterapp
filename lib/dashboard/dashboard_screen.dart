import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/fix_go__screen_constant.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/exit_app_dialog.dart';
import 'package:fixgotransporterapp/presentation/home_module/home_child_screen.dart';
import 'package:fixgotransporterapp/presentation/my_bid_module/my_bid_child_screen.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/my_post_child_screen.dart';
import 'package:fixgotransporterapp/presentation/profile_module/profile_child_screen.dart';
import 'package:flutter/material.dart';



class Dashboard extends StatefulWidget {

  final String isComeFrom;

  const Dashboard({Key? key, this.isComeFrom = ""}) : super(key: key);


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> implements
    HomeChildScreenListener,
    MyPostChildScreenListener,
    MyBidChildScreenListener,
    ProfileChildScreenListener{


  String currentScreen = "Dashboard";
  Widget? widDashboardScreen, widMenuScreen;
  bool isShow = true;

  String heading = "";

  @override
  void initState() {
    super.initState();
    heading = "FixGo";
    widget.isComeFrom == "1" ?
    addNewScreen(
        ProfileChildScreen(
          mListener: this,
        ),
        ScreenConstant.PROFILE_FRAGMENT) :
    addNewScreen(
        HomeChildScreen(
          mListener: this,
        ),
        ScreenConstant.HOME_PAGE);
  }


  Widget getContainer() {
    return Container(
      child: widDashboardScreen,
    );
  }

  getUpdateParentScreen(Widget showScreen) {
    return setState(() {
      widDashboardScreen = showScreen;
    });
  }

  addNewScreen(Widget newScreen, String currentScreenStatus) {
    currentScreen = currentScreenStatus;
    if (mounted) {
      setState(() {
        widDashboardScreen = newScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Material(
        child: Column(
          children: [
            Visibility(
              visible: isShow,
              child: Container(
                color: CommonColor.APP_BAR_COLOR,
                height: SizeConfig.safeUsedHeight * .12,
                child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
              ),
            ),
            Container(
              height:isShow == true ? SizeConfig.safeUsedHeight * .8 : SizeConfig.safeUsedHeight * .92,
              child: getContainer(),
            ),
            Container(
              height: SizeConfig.safeUsedHeight * .08,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 7,
                      spreadRadius: 3,
                      offset: const Offset(2, 2.0))
                ],
              ),
              child: getBottomBarDesign(
                  SizeConfig.screenHeight, SizeConfig.screenWidth),
            ),
          ],
        ),
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
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileChildScreen()));
            },
            child: Container(
                color: Colors.transparent,
              child: const Icon(Icons.notifications,
                color: Colors.transparent,),
          ),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("$heading",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*7.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          GestureDetector(
            
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
            child: Container(
              color: Colors.transparent,
              child: const Icon(Icons.notifications,
                color: Colors.transparent,),
            ),
          )
        ],
      ),
    );
  }


  Widget getBottomBarDesign(double parentHeight, double parentWidth) {
    return Container(
      decoration: const BoxDecoration(
        color: CommonColor.APP_BAR_COLOR,
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(17),
          // topRight: Radius.circular(17),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {

              isShow = true;

              heading = "FixGo";

              addNewScreen(
                  HomeChildScreen(
                    mListener: this,
                  ),
                  ScreenConstant.HOME_PAGE);
            },
            child: Container(
              height: parentHeight*0.07,
              width: parentWidth*0.17,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_outlined,
                    color: currentScreen == ScreenConstant.HOME_PAGE ? CommonColor.WHITE_COLOR
                        : CommonColor.SIGN_UP_TEXT_COLOR,),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.003),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: currentScreen == ScreenConstant.HOME_PAGE
                              ? CommonColor.WHITE_COLOR
                              : CommonColor.SIGN_UP_TEXT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {

              isShow = false;

              // heading = "FixGo";

              addNewScreen(
                  MyBidChildScreen(
                    mListener: this,
                  ),
                  ScreenConstant.MY_BID_FRAGMENT);
            },
            child: Container(
              height: parentHeight*0.07,
              width: parentWidth*0.17,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_outlined,
                    color: currentScreen == ScreenConstant.MY_BID_FRAGMENT ? CommonColor.WHITE_COLOR
                        : CommonColor.SIGN_UP_TEXT_COLOR,),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.003),
                    child: Text(
                      "My Bids",
                      style: TextStyle(
                          color: currentScreen == ScreenConstant.MY_BID_FRAGMENT
                              ? CommonColor.WHITE_COLOR
                              : CommonColor.SIGN_UP_TEXT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w400),

                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {

              isShow = false;

              addNewScreen(
                  MyPostChildScreen(
                    mListener: this,
                  ),
                  ScreenConstant.MY_POST_FRAGMENT);
            },
            onDoubleTap: () {},
            child: Container(
              height: parentHeight*0.07,
              width: parentWidth*0.17,
              decoration: BoxDecoration(
                  color: CommonColor.APP_BAR_COLOR,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: const AssetImage("assets/images/order_icon.png"),
                    color: currentScreen == ScreenConstant.MY_POST_FRAGMENT
                        ? CommonColor.WHITE_COLOR
                        : CommonColor.SIGN_UP_TEXT_COLOR,
                    height: parentHeight*0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.005),
                    child: Text(
                      "My Post",
                      style: TextStyle(
                          color: currentScreen == ScreenConstant.MY_POST_FRAGMENT
                              ? CommonColor.WHITE_COLOR
                              : CommonColor.SIGN_UP_TEXT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {

              heading = "Profile";

              isShow = true;
              addNewScreen(
                  ProfileChildScreen(
                    mListener: this,
                  ),
                  ScreenConstant.PROFILE_FRAGMENT);
            },
            onDoubleTap: () {},
            child: Container(
              height: parentHeight*0.07,
              width: parentWidth*0.17,
              decoration: BoxDecoration(
                  color: CommonColor.APP_BAR_COLOR,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: const AssetImage("assets/images/profile_icon.png"),
                    color: currentScreen == ScreenConstant.PROFILE_FRAGMENT
                        ? CommonColor.WHITE_COLOR
                        : CommonColor.SIGN_UP_TEXT_COLOR,
                    height: parentHeight*0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.005),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: currentScreen == ScreenConstant.PROFILE_FRAGMENT
                              ? CommonColor.WHITE_COLOR
                              : CommonColor.SIGN_UP_TEXT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static showExitDialog(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          // return Transform(
          //   transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: const ExitAppDialog(
                message: "Are You Sure To Exit",
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
  }

  Future<bool> _onBackPressed() {
    return showExitDialog(context);
  }
}
