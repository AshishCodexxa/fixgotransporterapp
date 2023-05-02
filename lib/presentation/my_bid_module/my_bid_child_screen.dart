import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/my_bid_module/accepted_bid_screen.dart';
import 'package:fixgotransporterapp/presentation/my_bid_module/canceled_bid_screen.dart';
import 'package:fixgotransporterapp/presentation/my_bid_module/pending_bids_screen.dart';
import 'package:flutter/material.dart';




class MyBidChildScreen extends StatefulWidget {
  
  final MyBidChildScreenListener mListener;
  
  const MyBidChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<MyBidChildScreen> createState() => _MyBidChildScreenState();
}

class _MyBidChildScreenState extends State<MyBidChildScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: CommonColor.APP_BAR_COLOR,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(SizeConfig.screenHeight * 0.022),
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                        fontFamily: 'Roboto_Medium'
                      ),
                      tabs: [
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
                              'Accepted',
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
                      ],
                    ),
                    Container(
                      color: CommonColor.APP_BAR_COLOR,
                      height: SizeConfig.screenHeight*0.007,
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              color: Colors.transparent,
              height: SizeConfig.screenHeight*0.9,
              child: TabBarView(
                children: <Widget>[
                  PendingBidScreen(),
                  AcceptedBidScreen(),
                  CanceledBidScreen(),
                ],
              ),
            )),
      ),
    );
  }
}


abstract class MyBidChildScreenListener{
  
}