import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'addNode.dart';

late ArCoreController arCoreController;
late ArCoreHitTestResult firstHit;

class ArCoreViewScreen extends StatefulWidget {
  final double zRotation;
  final double xPosition;
  final double yPosition;


  ArCoreViewScreen({required this.xPosition, required this.yPosition, required this.zRotation});
  @override
  ArCoreViewScreenState createState() => ArCoreViewScreenState();
}

class ArCoreViewScreenState extends State<ArCoreViewScreen> {

  @override
  Widget build(BuildContext context) {
     return ArCoreView(onArCoreViewCreated: onArCoreViewCreated, enableTapRecognizer: true, );
  }
  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }
  //
  Future addImage(ArCoreHitTestResult hit) async {
    final bytes =
    (await rootBundle.load('assets/images/jayz.jpeg')).buffer.asUint8List();

    imageNode = ArCoreNode(
      name: 'imageNode',
      image: ArCoreImage(bytes: bytes, width: 500, height: 500),
      position: hit.pose.translation + vector.Vector3(0,0, 0),
      rotation: hit.pose.rotation + vector.Vector4(0, 500,0, 0),
    );


    arCoreController.addArCoreNode(imageNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    firstHit = hits.first;
    print('distance: ${hits.first.distance}');

    addImage(firstHit);
  }

}