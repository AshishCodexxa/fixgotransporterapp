import 'package:dio/dio.dart';
import 'package:fixgotransporterapp/common_file/common_color.dart';
import 'package:fixgotransporterapp/dashboard/dashboard_screen.dart';
import 'package:fixgotransporterapp/data/api_constant/api_url.dart';
import 'package:fixgotransporterapp/data/data_constant/constant_data.dart';
import 'package:fixgotransporterapp/presentation/home_module/pick_up_location_screen.dart';
import 'package:fixgotransporterapp/presentation/home_module/recent_pickup_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class PostDeleteConfirmationDialog extends StatefulWidget {

  final String message;
  final String postId;
  final String openFrom;

  const PostDeleteConfirmationDialog({super.key, required this.message, required this.postId, required this.openFrom});

  @override
  State<PostDeleteConfirmationDialog> createState() => _PostDeleteConfirmationDialogState();
}

class _PostDeleteConfirmationDialogState extends State<PostDeleteConfirmationDialog> {


  final Dio _dio = Dio();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.postId);
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
            print("Yesss");

            widget.openFrom == "1" ?
            pickUpAddressDeleteById(postId: widget.postId).then((value){
              if(mounted){
                setState(() {

                });
              }
            }) :
            postDeleteById(postId: widget.postId).then((value){
              if(mounted){
                setState(() {

                });
              }
            });
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: CommonColor.SIGN_UP_TEXT_COLOR,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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



  Future<void> postDeleteById({required String postId}) async {
    String url = "${ApiConstants().baseUrl}post/delete/$postId";
    String? sessionToken = GetStorage().read<String>(
        ConstantData.userAccessToken);

    try {
      var result = await _dio.delete(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $sessionToken',
            },
            validateStatus: (status) {
              return status! < 500;
            },
          )
      );

      print(result.statusCode);

      if(result.statusCode == 400){
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sorry! Expired Post cannot be deleted.")));
      }else if(result.statusCode == 200){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(isComeFrom: widget.openFrom == "2" ? '2' : "3",)));
        // if(widget.openFrom == 2){
        //
        // }else{
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(isComeFrom: '3',)));
        // }
      }


    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Future<void> pickUpAddressDeleteById({required String postId}) async {
    String url = "${ApiConstants().baseUrl}${ApiConstants().deletePickupAddress}$postId";
    String? sessionToken = GetStorage().read<String>(
        ConstantData.userAccessToken);

    try {
      var result = await _dio.delete(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $sessionToken',
            },
            // validateStatus: (status) {
            //   return status! < 500;
            // },
          )
      );

      print(result.statusCode);

      if(result.statusCode == 200){
        Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PreviousAddressListScreen()));
      }


    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
