
import 'package:ar_posters/addNode.dart';
import 'package:ar_posters/arCoreView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'arCoreView.dart';
import 'homePage.dart';

class SizeController extends StatefulWidget {

  @override
  SizeControllerState createState() => SizeControllerState();
}

class SizeControllerState extends State<SizeController> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
   return Container (
     width: mediaQuery.size.width,
     height: 80,
     padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
     child: FlutterSlider(
       values: [scale],
       max: 2,
       min: 0.1,
       step: FlutterSliderStep(step: 0.1),
       axis: Axis.horizontal,
       handler: FlutterSliderHandler(
           decoration: BoxDecoration(
               color: Colors.transparent
           ),
           child: Icon(Icons.photo_size_select_large, color: Colors.white,)),
    trackBar:  FlutterSliderTrackBar(
    inactiveTrackBar: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.transparent,
    border: Border.all(width: 1.5, color: Colors.white),
    ),
    activeTrackBar: BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    color: Colors.transparent,
    // border: Border(top: BorderSide(width: 1.5, color: Colors.black))
    ),
    activeTrackBarHeight: 150,
    inactiveTrackBarHeight: 150,

     ),
         onDragStarted: (handlerIndex, lowerValue, upperValue){
         setState(() {
           arCoreController.removeNode(nodeName: 'imageNode');
         });
         },
       onDragging: (handlerIndex, lowerValue, upperValue) {
         setState(() {
           arCoreController.removeNode(nodeName: 'imageNode').then((value) =>
           {
             scale = lowerValue,
             print('SCALE IS $scale'),
             addNode(firstHit, xPosition, yPosition, scale, zRotation)
           });
         });
       },
       // onDragCompleted: (handlerIndex, lowerValue, upperValue) {
       //   setState(() {
       //     Future.wait([
       //       arCoreController.removeNode(nodeName: 'imageNode').then((value) =>
       //       {
       //         addNode(firstHit, xPosition, yPosition, scale, zRotation)
       //       })
       //     ]);
       //   });
       // },
   ));
  }


}