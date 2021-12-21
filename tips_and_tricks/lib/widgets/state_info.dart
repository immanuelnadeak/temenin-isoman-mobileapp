import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tips_and_tricks/common/styles.dart';

Widget stateInfo(String message, bool noData) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          noData
              ? const Icon(
                  Icons.search_off_rounded,
                  size: 100,
                  color: secondaryColor,
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: darkSecondaryColor,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: myTextTheme.headline5?.apply(
                color: darkSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
