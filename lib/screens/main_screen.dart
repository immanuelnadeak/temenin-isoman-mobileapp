import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:temenin_isoman_mobileapp/widgets/custom_drawer.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        style: DrawerStyle.Style1,
        menuScreen: customDrawer(context),
        mainScreen: HomeScreen(
          zoomDrawerController: _drawerController,
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        backgroundColor: Colors.grey,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeIn,
      ),
    );
  }
}
