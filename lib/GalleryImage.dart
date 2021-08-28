import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'addNode.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'homePage.dart';
late Uint8List uint8list;
var image;

class GalleryImage extends StatefulWidget {

  GalleryImageState createState() => GalleryImageState();
}

class GalleryImageState extends State<GalleryImage> {

  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  // var image;
    Future pickImage () async{
     try {
       late XFile XFilesImage;
       await ImagePicker().pickImage(source: ImageSource.gallery).then((
           pickedImage) =>
       {
           setState(() {
             image = File(pickedImage!.path);
             // XFilesImage = pickedImage;

             // uint8list = image.readAsBytes(); //could be error here(type error - XFile vs File)
           }),
           XFilesImage = pickedImage!,

       }
       );
       // await XFilesImage.readAsBytes().
       // print('IMAGE PICKER HERE FIRST');
       // setState(()  {
       //   uint8list = await XFilesImage.readAsBytes();
       // });
       uint8list = await XFilesImage.readAsBytes();
       print('THIS HAPPENED');
       return uint8list;
   } catch(e){
       print('THERE WAS AN ERROR');
       print(e);
     }
   }
  // void _onImageButtonPressed(ImageSource source,
  //     {BuildContext? context}) async {
  //
  //           try {
  //             File pickedFile = await _picker.pickImage(
  //               source: ImageSource.gallery,
  //               maxWidth: width,
  //               maxHeight: height,
  //               imageQuality: 50,
  //             );
  //             setState(() {
  //              image = pickedFile;
  //             });
  //           } catch (e) {
  //             setState(() {
  //               _pickImageError = e;
  //             });
  //           }
  //
  //
  //
  //
  //   }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 40, left: 20),
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: (image != null) ?
              Image.file(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.scaleDown,
              ) : Container(
            height: 100,
            width: 100,
            child: Icon(Icons.camera_alt, color: Colors.white,),
          )
        ),
      ),
      SizedBox(
        height: mediaQuery.size.height-230,
      ),
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
          color: Colors.transparent,
        ),
        alignment: Alignment.bottomCenter,
        child: IconButton(
          iconSize: 30,
          onPressed: (){
            pickImage();
          },
          icon: Icon(Icons.upload_sharp, color: Colors.white,),
        ),
      ),
    ]);

  }


}