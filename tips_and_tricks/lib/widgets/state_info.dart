import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tips_and_tricks/common/styles.dart';

Widget noData(IconData icon, String message) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Icon(
            icon,
            size: 100,
            color: secondaryColor,
          ),
          Text(
            message,
            style: myTextTheme.headline5?.apply(
              color: darkSecondaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
