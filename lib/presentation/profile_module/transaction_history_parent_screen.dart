import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:fixgotransporterapp/presentation/profile_module/payment_history_child_screen.dart';
import 'package:fixgotransporterapp/presentation/profile_module/withdrawal_cash_history_child_screen.dart';
import 'package:flutter/material.dart';


class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen>
    with SingleTickerProviderStateMixin {


  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      /*body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

        ],
      )*/
      appBar: AppBar(
        titleSpacing: SizeConfig.screenWidth*0.105,
        toolbarHeight: SizeConfig.screenHeight*0.1,
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: CommonColor.APP_BAR_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Transaction History",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Regular",
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth*0.07,
                  right: SizeConfig.screenWidth*0.07
              ),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  border: Border.all(color: Colors.black38)
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [

                    Text("Payment",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*4.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w500,

                      ),),


                    Text("Withdrawal",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*4.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w500,

                      ),),
                  ],
                ),
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [

                  PaymentHistoryScreen(),

                  WithdrawalCashHistoryScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget getTopText(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.05,
          left: parentWidth * 0.035,
          right: parentWidth * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onDoubleTap: () {},
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new,
                  color: CommonColor.WHITE_COLOR,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("My Wallet",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.5,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }
}
