import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


class ImageObjectScreen extends StatefulWidget {
  @override
  _ImageObjectScreenState createState() => _ImageObjectScreenState();
}

class _ImageObjectScreenState extends State<ImageObjectScreen> {
  late ArCoreController arCoreController;
  late
  double xPosition = 0;
  int yPosition = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image object'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated,
                enableTapRecognizer: true,
                enableUpdateListener: true,
              ),
            ),
            IconButton(
              alignment: Alignment.bottomRight,
                onPressed: () {
                  setState(() {
                    xPosition += 500;
                  });
            }, icon: Icon(Icons.arrow_right))
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  Future _addImage(ArCoreHitTestResult hit) async {
    final bytes =
    (await rootBundle.load('assets/images/jayz.jpeg')).buffer.asUint8List();

    final image = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 500, height: 500),
      position: hit.pose.translation + vector.Vector3(xPosition, 0.0, 0),
      rotation: hit.pose.rotation + vector.Vector4(0, 500,0, 0),
    );


    arCoreController.addArCoreNodeWithAnchor(image);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addImage(hit);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}