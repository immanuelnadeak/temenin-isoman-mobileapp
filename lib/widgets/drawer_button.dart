import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tips_and_tricks/common/styles.dart';

Widget drawerButton(BuildContext context, String title, IconData icon, String route){
  return ListTile(
    title:  Text(
      title,
      style: myTextTheme.bodyText1,
    ),
    leading: Icon(icon),
    onTap: () {
      Navigator.pushNamed(
        context,
        route,
      );
    },
  );
}