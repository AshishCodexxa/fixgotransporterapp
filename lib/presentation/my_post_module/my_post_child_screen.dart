import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/my_post_module/pending_post_screen.dart';
import 'package:flutter/material.dart';





class MyPostChildScreen extends StatefulWidget {

  final MyPostChildScreenListener mListener;

  const MyPostChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<MyPostChildScreen> createState() => _MyPostChildScreenState();
}

class _MyPostChildScreenState extends State<MyPostChildScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.screenHeight * 0.13),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    color: CommonColor.APP_BAR_COLOR,
                    height: SizeConfig.screenHeight*0.12,
                    child: TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                            right: SizeConfig.screenWidth*0.05,
                            top: SizeConfig.screenHeight*0.07),
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto_Regular',
                            color: Colors.white
                        ),
                        indicator: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.white,
                              width: SizeConfig.screenWidth*0.005) ),
                        ),
                        tabs: const [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Pending',
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'On Going',
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Completed',
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Cancelled',
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    color: CommonColor.APP_BAR_COLOR,
                    height: SizeConfig.screenHeight*0.007,
                  ),
                ],
              ),
            ),
            body: Container(
              color: Colors.transparent,
              height: SizeConfig.screenHeight*0.9,
              child: TabBarView(
                children: <Widget>[
                 PendingPostScreen(),
                 Container(),
                 Container(),
                 Container(),
                ],
              ),
            )),
      ),
    );
  }
}



abstract class MyPostChildScreenListener{

}