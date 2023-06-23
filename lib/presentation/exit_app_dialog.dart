import 'dart:io';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:flutter/material.dart';


class ExitAppDialog extends StatefulWidget {
  final String message;


  const ExitAppDialog(
      {required this.message});

  @override
  _ExitAppDialogState createState() => _ExitAppDialogState();
}

class _ExitAppDialogState extends State<ExitAppDialog> {
  late double textSize;
  bool isLoaderShow = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onDoubleTap: () {},
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 10),
                child: Center(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getMessageText(),
                          getAddForButtonsLayout(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned.fill(child: CommonWidget.isLoaderShow(isLoaderShow))
          ],
        ),
      ),
    );
  }

  /*text filed Widget*/
  Widget getMessageText() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 2,
        left: 3,
        right: 3,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(widget.message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  // fontFamily: Constant.AVENIR_HEAVY,
                ),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  /* Widget for Buttons Layout0 */
  Widget getAddForButtonsLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            exit(0);
          },
          onDoubleTap: () {},
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    // fontFamily: Constant.AVENIR_HEAVY
                  ),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          onDoubleTap: () {},
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: CommonColor.SIGN_UP_TEXT_COLOR,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    // fontFamily: Constant.AVENIR_HEAVY
                  ),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

abstract class BackPressDialogInterface {}