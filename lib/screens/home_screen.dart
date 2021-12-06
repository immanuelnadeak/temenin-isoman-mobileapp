import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tips_and_tricks/common/styles.dart';

class HomeScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  static const routeName = '/home-screen';

  const HomeScreen({
    Key? key,
    required this.zoomDrawerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Temenin Isoman"),
          backgroundColor: primaryColor,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.short_text,
                  size: 30,
                ),
                onPressed: () {
                  zoomDrawerController.toggle!();
                },
              );
            },
          ),
        ),
        // drawer: customDrawer(context),
        body: const Center(
          child: Text(
            'My Page!',
          ),
        ),
      ),
    );
  }
}
