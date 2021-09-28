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
        IconButton(
          padding: EdgeInsets.only(bottom: mediaQuery.size.height - 260, right: mediaQuery.size.width - 60, left: 20),
          icon: Icon(Icons.delete, color: Colors.white,),
          iconSize: 35, onPressed: () {
            setState(() {
              arCoreController.removeNode(nodeName: 'imageNode');
            });
        },
        ),
        // IconButton(onPressed: () {
        //   setState(() {
        //     scale += 0.1;
        //     arCoreConveNode(nodeName: 'imageNode');
        //     addNode(firstHit, xPosition, yPosition, scale);
        //     print('scale $scale');
        //   });
        // },
        //   icon: Icon(Icons.add),
        //   iconSize: 30,
        //   alignment: Alignment.bottomRight,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 180,
                padding: EdgeInsets.only( bottom: 20, left: 30),
                child: FlutterSlider(
                    values: [yRotation],
                    max: 550,
                    min: -550,
                    step: FlutterSliderStep(step: 10),
                    axis: Axis.vertical,
                    handler: FlutterSliderHandler(
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: Icon(Icons.rotate_left_rounded, color: Colors.white,)),
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
                        arCoreController.removeNode(nodeName: 'imageNode').whenComplete(() =>
                        {
                        addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation, yRotation),
                        });

                        // addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation);
                        print('DRAGGING HAS STARTED');
                      });
                    },
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        arCoreController.removeNode(nodeName: 'rotatedNode');
                        yRotation = lowerValue;
                        addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation, yRotation);


                      });
                    },
                    onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                      setState(() {

                        arCoreController.removeNode(nodeName: 'rotatedNode').whenComplete(() =>
                        {
                        imageNode.rotation.value = firstHit.pose.rotation + vector.Vector4(yRotation,500,0,zRotation),
                            arCoreController.addArCoreNode(imageNode),
                        });

                        // arCoreController.removeNode(nodeName: 'imageNode');
                        // imageNode.rotation.value = firstHit.pose.rotation + vector.Vector4(0, 500, 0, zRotation);
                        // arCoreController.addArCoreNode(imageNode);
                      });
                    }
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20) ,
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
                              arCoreController.removeNode(nodeName: 'imageNode').whenComplete(() =>
                              {
                              yPosition += 0.1,
                                imageNode.position.value = firstHit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
                              arCoreController.addArCoreNode(imageNode),
                              });

                              // addNode(firstHit, xPosition, yPosition, scale, zRotation);
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
                              arCoreController.removeNode(nodeName: 'imageNode').whenComplete(() =>
                              {
                                xPosition += -0.1,
                              imageNode.position.value = firstHit.pose.translation + vector.Vector3(xPosition,yPosition,0),
                              arCoreController.addArCoreNode(imageNode),
                              });

                              // addNode(firstHit, xPosition, yPosition, scale, zRotation);
                              // print('xPosition $xPosition');
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
                              arCoreController.removeNode(nodeName: 'imageNode').whenComplete(() =>
                              {
                              xPosition += 0.1,
                                  imageNode.position.value = firstHit.pose.translation + vector.Vector3(xPosition,yPosition,0),
                              arCoreController.addArCoreNode(imageNode),

                            });

                              // addNode(firstHit, xPosition, yPosition, scale, zRotation);
                              // print('xPosition $xPosition');
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
                            setState((){
                              arCoreController.removeNode(nodeName: 'imageNode').whenComplete(() =>
                              {
                              yPosition += -0.1,
                                  imageNode.position.value = firstHit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
                              arCoreController.addArCoreNode(imageNode),
                              });

                              // addNode(firstHit, xPosition, yPosition, scale, zRotation);
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
                padding: EdgeInsets.only(bottom: 20, right: 30),
                child: FlutterSlider(
                    values: [zRotation],
                    max: 250,
                    min: -250,
                    step: FlutterSliderStep(step: 25),
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
                              arCoreController.removeNode(nodeName: 'imageNode').whenComplete(() =>
                              {
                              addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation, yRotation),
                              });

                              // addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation);
                              print('DRAGGING HAS STARTED');
                              });
                    },
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                      arCoreController.removeNode(nodeName: 'rotatedNode').whenComplete(() =>
                      {
                        zRotation = lowerValue,
                        addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation, yRotation),
                      });

                      });
                    },
                    onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                      setState(() {

                        arCoreController.removeNode(nodeName: 'rotatedNode').whenComplete(() =>
                        {
                        imageNode.rotation.value = firstHit.pose.rotation + vector.Vector4(yRotation,500,0,zRotation),
                            arCoreController.addArCoreNode(imageNode),


                        });

                        // arCoreController.removeNode(nodeName: 'imageNode');
                        // imageNode.rotation.value = firstHit.pose.rotation + vector.Vector4(0, 500, 0, zRotation);
                        // arCoreController.addArCoreNode(imageNode);
                      });
                    }

                    //   // arCoreController.removeNode(nodeName: 'imageNode');
                    //   // zRotation = lowerValue;
                    //   // imageNode.rotation.value = firstHit.pose.rotation + vector.Vector4(0,500,0,zRotation);
                    //   // arCoreController.addArCoreNode(imageNode);
                    //     // addNode(firstHit, xPosition, yPosition, scale, zRotation);
                    //     // addRotatedNode(firstHit, xPosition, yPosition, scale, zRotation);
                    //     // // {
                    //     //   zRotation = lowerValue;
                    //     //   arCoreController.removeNode(nodeName: 'rotatedNode');
                    //     //   arCoreController.addArCoreNode(ArCoreNode(
                    //     //     rotation: vector.Vector4(0,500,0,zRotation),
                    //

                    //       // arCoreController.removeNode(nodeName: 'rotatedNode')
                    //       //     .whenComplete(() =>
                    //       // {
                    //       //   zRotation = lowerValue,
                    //       //   addRotatedNode(
                    //       //       firstHit, xPosition, yPosition, scale, zRotation),
                    //       //   print('THIS IS THE ZROTATION: $zRotation')
                    //       //   // addNodeWithName(firstHit, xPosition, yPosition, scale, zRotation, 'rotatedNode');
                    //       // });
                    //   // });
                    //


                    //   print('ON DRAGGINGCOMPLETED FUNC STARTED');
                    //   // print('Z ROTATION IN ONDRAG COMPELTED IS $zRotation');
                    //
                    //     setState(()  {
                    //       arCoreController.init();
                    //       Future.delayed(Duration(seconds: 2), () {
                    //         print('DELAYED FUNCtiON IS GETTING CALLED');
                    //         // arCoreController.removeNode(nodeName: 'rotatedName');
                    //         addNode(firstHit, xPosition, yPosition, scale, zRotation);
                    //
                    //       });
                    //       // Future.wait([
                    //       //   arCoreController.removeNode(nodeName: 'rotatedName').then((value) => {
                    //       //     addNode(firstHit, xPosition, yPosition, scale, zRotation)
                    //       //   })
                    //       // ]);
                    //     });
                    //     // zRotation = lowerValue;
                    //     // addNode(firstHit, xPosition, yPosition, scale, zRotation);
                    //     //  print('zRotation after drag completed is $zRotation');
                    //     // print('on DRAG COMPLETED after remove node $zRotation');
                    // }


                        // arCoreController.removeNodeWithIndex(handlerIndex);
                        // // arCoreController.removeNode(nodeName: 'rotatedNode');


                ),
              ),
            ],
          ),
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