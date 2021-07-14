import 'package:agri_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasBackground;

  CustomActionBar({
    this.title = '',
    this.hasBackArrow = true,
    this.hasBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: hasBackground
              ? LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1),
                )
              : null),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 16.0,
        right: 12.0,
        bottom: 42.0,
      ),
      child: Row(
        children: [
          if (hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: hasBackArrow ? 16 : 0),
            child: Text(
              title,
              style: Constants.boldHeading,
            ),
          ),
        ],
      ),
    );
  }
}
