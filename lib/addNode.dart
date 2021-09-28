import 'package:ar_posters/GalleryImage.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'arCoreView.dart';
import 'homePage.dart';

late ArCoreNode imageNode;
late ArCoreNode rotatedNode;
late ArCoreNode scaledNode;
late ArCoreNode yRotatedNode;
vector.Vector3 scaleVector = vector.Vector3(scale, scale,1);

Future addNode(ArCoreHitTestResult hit, double xPosition, double yPosition,
    double scale, double zRotation, double yRotation
    ) async {
  final bytes = uint8list;
  var decodedImage = await decodeImageFromList(uint8list);
  // (await rootBundle.load(image)).buffer.asUint8List();
  // final bytes =
  // (await rootBundle.load('assets/images/jayz.jpeg')).buffer.asUint8List();

  imageNode = ArCoreNode(
    scale: vector.Vector3(scale,scale,1),
    image: ArCoreImage(bytes: bytes, width: decodedImage.width, height: decodedImage.height),
    position: hit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
    rotation: hit.pose.rotation + vector.Vector4(yRotation, 500,0, zRotation),
  );


  arCoreController.addArCoreNode(imageNode);
}

Future addRotatedNode(ArCoreHitTestResult hit, double xPosition, double yPosition,
    double scale, double zRotation, double yRotation) async {

  rotatedNode = ArCoreNode(
    scale: vector.Vector3(scale, scale, 1),
    position: hit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
    rotation: hit.pose.rotation + vector.Vector4(yRotation, 500,0, zRotation),
  );
  arCoreController.addArCoreNode(rotatedNode);
}

Future addScaledNode(ArCoreHitTestResult hit, double xPosition, double yPosition,
    double scale, double zRotation, double yRotation) async {

  scaledNode = ArCoreNode(
    scale: vector.Vector3(scale, scale, 1),
    position: hit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
    rotation: hit.pose.rotation + vector.Vector4(yRotation, 500,0, zRotation),
  );
  arCoreController.addArCoreNode(scaledNode);
}

Future addYRotatedNode(ArCoreHitTestResult hit, double xPosition, double yPosition,
    double scale, double zRotation, double yRotation) async {

  yRotatedNode = ArCoreNode(
    scale: vector.Vector3(scale, scale, 1),
    position: hit.pose.translation + vector.Vector3(xPosition, yPosition, 0),
    rotation: hit.pose.rotation + vector.Vector4(yRotation, 500,0, zRotation),
  );
  arCoreController.addArCoreNode(yRotatedNode);
}

