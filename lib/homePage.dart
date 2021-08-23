import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'arCoreView.dart';
import 'addNode.dart';
import 'size.dart';
import 'package:circular_menu/circular_menu.dart';
import 'adjustController.dart';

double xPosition = 0;
double yPosition = 0;
int selectedIndex = 0;
double zRotation = 0;
double scale = 1;
late ArCoreNode newNode;
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
final screen = [SizedBox(), AdjustController(), SizeController()];
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
           ArCoreViewScreen(xPosition: xPosition, yPosition: yPosition, zRotation: zRotation),
          CircularMenu(
            toggleButtonSize: 30,
            radius: 80,
            toggleButtonColor: Colors.transparent,
            toggleButtonOnPressed: (){
              setState(() {
                setState(() {
                  selectedIndex = 0;
                });
              });
            },
              alignment: Alignment.topRight,
              items: [
            CircularMenuItem(icon: Icons.home, color: Colors.transparent,onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            }),
            CircularMenuItem(icon: Icons.search, color:Colors.transparent, onTap: () {
              setState(() {
                selectedIndex = 2;
              });
              //callback
            }),
            CircularMenuItem(icon: Icons.settings, color: Colors.transparent, onTap: () {
              //callback
            }),
          ]),
          screen[selectedIndex],
        ],
      ),
    );
  }

}