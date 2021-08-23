import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'arCoreView.dart';
late ArCoreNode imageNode;
late ArCoreNode rotatedNode;

Future addNode(ArCoreHitTestResult hit, double xPosition, double yPosition,
    double scale, double zRotation
    ) async {
  final bytes =
  (await rootBundle.load('assets/images/jayz.jpeg')).buffer.asUint8List();

  imageNode = ArCoreNode(
    name: 'imageNode',
    scale: vector.Vector3(scale, scale, 1),
    image: ArCoreImage(bytes: bytes, width: 500, height: 500),
    position: hit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
    rotation: hit.pose.rotation + vector.Vector4(0, 500,0, zRotation),
  );


  arCoreController.addArCoreNode(imageNode);
}

Future addRotatedNode(ArCoreHitTestResult hit, double xPosition, double yPosition,
    double scale, double zRotation) async {
  final bytes =
  (await rootBundle.load('assets/images/jayz.jpeg')).buffer.asUint8List();

  rotatedNode = ArCoreNode(
    name: 'rotatedNode',
    scale: vector.Vector3(scale, scale, 1),
    image: ArCoreImage(bytes: bytes, width: 500, height: 500),
    position: hit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
    rotation: hit.pose.rotation + vector.Vector4(0, 500,0, zRotation),
  );


  arCoreController.addArCoreNode(rotatedNode);
}
