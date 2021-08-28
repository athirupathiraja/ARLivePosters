import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'addNode.dart';
import 'package:ar_posters/GalleryImage.dart';

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
    final bytes = uint8list;
    // (await rootBundle.load(imagePath)).buffer.asUint8List();
    // final bytes = (await image.buffer.asUnit8List());

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
    print('HIT LENGTH ${hits.length}');
    // if (hits.length > 0){
    //   for(int i = 0; i< hits.length; i++){
    //     hits.removeAt(i);
    //   }
    //   firstHit = hits.last;
    // }

    addImage(firstHit);
  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

}