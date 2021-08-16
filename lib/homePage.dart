import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'arCoreView.dart';
import 'addNode.dart';
import 'package:circular_menu/circular_menu.dart';
import 'adjustController.dart';

double xPosition = 0;
double yPosition = 0;
int selectedIndex = 0;

double scale = 1;
late ArCoreNode newNode;
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image object'),
      ),

      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
           ArCoreViewScreen(xPosition: xPosition),
          CircularMenu(items: [
            CircularMenuItem(icon: Icons.home, onTap: () {


            }),
            CircularMenuItem(icon: Icons.search, onTap: () {
              //callback
            }),
            CircularMenuItem(icon: Icons.settings, onTap: () {
              //callback
            }),
          ]),
        ],
      ),
    );
  }

}