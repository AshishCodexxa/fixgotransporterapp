
import 'dart:io';
import 'package:fixgotransporterapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class CameraGalleryDialog extends StatefulWidget {
  const CameraGalleryDialog({Key? key}) : super(key: key);

  @override
  State<CameraGalleryDialog> createState() => _CameraGalleryDialogState();
}

class _CameraGalleryDialogState extends State<CameraGalleryDialog> {


  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];


  Future<List<XFile>> selectImages() async {
    final List<XFile> selectedImages = await
    imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty && selectedImages.length > 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
              Text("You can upload only 3 Images")));

    }

    return selectedImages;
  }

  Future<XFile?> capturedImages() async {

    final XFile? capImages = await
    imagePicker.pickImage(source: ImageSource.camera);

    return capImages;
  }




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03,
              left: SizeConfig.screenWidth*0.07,
              right: SizeConfig.screenWidth*0.07),
              child: GestureDetector(
                onDoubleTap: (){},
                onTap: () async {

                  // final XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);

                  setState(() {
                    if((imageFileList?.length ?? 0 ) > 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                            Text("You can upload only 3 Images")));
                    return;
                    }

                    capturedImages().then((value){
                      if(value == null) return;
                      Navigator.of(context).pop([value]);
                    });
                  });

                },
                child: Container(
                  height: SizeConfig.screenHeight*0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Camera",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto_Bold',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockSizeHorizontal*5.0
                    ),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.05,
                  left: SizeConfig.screenWidth*0.07,
                  right: SizeConfig.screenWidth*0.07),
              child: GestureDetector(

                onTap: (){
                  // print(_imagess.length);


                  setState(() {
                    if((imageFileList?.length ?? 0 ) > 3)
                    {ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                            Text("You can upload only 3 Images")));
                      return;
                    }

                    selectImages().then((value) => Navigator.of(context).pop(value));
                  });
                },
                child: Container(
                  height: SizeConfig.screenHeight*0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Gallery",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto_Bold',
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeHorizontal*5.0
                      ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

