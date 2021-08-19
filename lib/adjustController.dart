import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'arCoreView.dart';
import 'addNode.dart';
import 'package:circular_menu/circular_menu.dart';
import 'homePage.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class AdjustController extends StatefulWidget  {

  @override
  AdjustControllerState createState() => AdjustControllerState();
}

class AdjustControllerState extends State<AdjustController>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // IconButton(onPressed: () {
        //   setState(() {
        //     scale += 0.1;
        //     arCoreController.removeNode(nodeName: 'imageNode');
        //     addNode(firstHit, xPosition, yPosition, scale);
        //     print('scale $scale');
        //   });
        // },
        //   icon: Icon(Icons.add),
        //   iconSize: 30,
        //   alignment: Alignment.bottomRight,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: mediaQuery.size.width/2 -65, bottom: 20) ,
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      shape: BoxShape.circle,
                      color: Colors.transparent,
              ),
                    child: IconButton(
                      padding: EdgeInsets.all(3),
                        onPressed: () {
                          setState(() {
                            yPosition += 0.1;
                            arCoreController.removeNode(nodeName: 'imageNode');
                            addNode(firstHit, xPosition, yPosition, scale, zRotation);
                            print('yPosition $yPosition');
                          });
                        }, icon: Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white,size: 30,)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                          color: Colors.transparent,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                          setState(() {
                            xPosition += -0.1;
                            arCoreController.removeNode(nodeName: 'imageNode');
                            addNode(firstHit, xPosition, yPosition, scale, zRotation);
                            print('xPosition $xPosition');
                          });
                        }, icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.white, size: 30,)),
                      ),
                      SizedBox(width: 43,),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                          color: Colors.transparent,
                        ),
                        child: IconButton(
                          iconSize:30,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                          setState(() {
                            xPosition += 0.1;
                            arCoreController.removeNode(nodeName: 'imageNode');
                            addNode(firstHit, xPosition, yPosition, scale, zRotation);
                            print('xPosition $xPosition');
                          });
                        }, icon: Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white,size:30,), ),
                      )
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(3),
                      onPressed: () {
                        arCoreController.removeNode(nodeName: 'rotatedNode');
                      setState(() {
                        yPosition += -0.1;
                        arCoreController.removeNode(nodeName: 'imageNode');
                        addNode(firstHit, xPosition, yPosition, scale, zRotation);
                        print('yPosition $yPosition');
                      });
                    },
                      icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 30,),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 70,
              height: 180,
              padding: EdgeInsets.only(left: 35, bottom: 20),
              child: FlutterSlider(
                  values: [0],
                  max: 250,
                  min: -250,
                  axis: Axis.vertical,
                  handler: FlutterSliderHandler(
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: Icon(Icons.threed_rotation, color: Colors.white,)),
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
                    activeTrackBarHeight: 60,
                    inactiveTrackBarHeight: 60,
                  ),
                  onDragStarted: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
    arCoreController.removeNode(nodeName: 'imageNode');
    addNodeWithName(firstHit, xPosition, yPosition, scale, zRotation, 'rotatedNode');
    print('DRAGGING HAS STARTED');
    });
    },
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    setState(() {
                      zRotation = lowerValue;
                      arCoreController.removeNode(nodeName: 'rotatedNode');
                      addNodeWithName(firstHit, xPosition, yPosition, scale, zRotation, 'rotatedNode');
                    });

                  },
                  // onDragCompleted: (handlerIndex, lowerValue, upperValue){
                  //   arCoreController.removeNode(nodeName: 'rotatedNode');
                  //   setState(()  {
                  //     zRotation = lowerValue;
                  //     print('zRotation after drag completed is $zRotation');
                  //     // arCoreController.removeNodeWithIndex(handlerIndex);
                  //     // // arCoreController.removeNode(nodeName: 'rotatedNode');
                  //     // addNode(firstHit, xPosition, yPosition, scale, zRotation);
                  //   });
                  // }
              ),
            ),
          ],
        ),
        // Container(
        //     alignment: Alignment.bottomRight,
        //     child: Text(
        //         'xPosition: $xPosition yPosition:$yPosition scale: $scale'
        //     )
        // ),
      ],
    );
  }


}