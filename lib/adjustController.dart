import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'arCoreView.dart';
import 'addNode.dart';
import 'package:circular_menu/circular_menu.dart';

class AdjustController extends StatefulWidget  {

  @override
  AdjustControllerState createState() => AdjustControllerState();
}

class AdjustControllerState extends State<AdjustController>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(onPressed: () {
          setState(() {
            scale += 0.1;
            arCoreController.removeNode(nodeName: 'imageNode');
            addNode(firstHit, xPosition, yPosition, scale);
            print('scale $scale');
          });
        },
          icon: Icon(Icons.add),
          iconSize: 30,
          alignment: Alignment.bottomRight,),
        Container(
          height: 160,
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 200, bottom: 10, right: 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      yPosition += 100;
                      arCoreController.removeNode(nodeName: 'imageNode');
                      addNode(firstHit, xPosition, yPosition, scale);
                      print('yPosition $yPosition');
                    });
                  }, icon: Icon(Icons.arrow_drop_up)),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      xPosition += -100;
                      arCoreController.removeNode(nodeName: 'imageNode');
                      addNode(firstHit, xPosition, yPosition, scale);
                      print('xPosition $xPosition');
                    });
                  }, icon: Icon(Icons.arrow_left), iconSize: 30,),
                  IconButton(onPressed: () {
                    setState(() {
                      xPosition += 100;
                      arCoreController.removeNode(nodeName: 'imageNode');
                      addNode(firstHit, xPosition, yPosition, scale);
                      print('xPosition $xPosition');
                    });
                  }, icon: Icon(Icons.arrow_right), iconSize: 30,)
                ],
              ),
              IconButton(onPressed: () {
                setState(() {
                  yPosition += -100;
                  arCoreController.removeNode(nodeName: 'imageNode');
                  addNode(firstHit, xPosition, yPosition, scale);
                  print('yPosition $yPosition');
                });
              },
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconSize: 30,)
            ],
          ),
        ),
        Container(
            alignment: Alignment.bottomRight,
            child: Text(
                'xPosition: $xPosition yPosition:$yPosition scale: $scale'
            )
        ),
      ],
    ),
  }


}