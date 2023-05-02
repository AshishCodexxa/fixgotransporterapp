import 'package:fixgotransporterapp/common_file/size_config.dart';
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
      body: Column(
        children: [

        ],
      ),
    );
  }
}


abstract class MyBidChildScreenListener{
  
}