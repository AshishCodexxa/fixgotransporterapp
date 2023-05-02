import 'package:fixgotransporterapp/common_file/size_config.dart';
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
      body: Column(
        children: [

        ],
      ),
    );
  }
}


abstract class MyPostChildScreenListener{

}