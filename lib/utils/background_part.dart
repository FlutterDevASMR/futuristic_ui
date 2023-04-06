import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futuristic_ui/utils/constants.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class BackgroundPart extends StatelessWidget {
  const BackgroundPart({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: height / 12,
            child: Container(
              height: 6,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height / 16,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Constants.blueColor,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 0.5],
                  ),
                  border: GradientBoxBorder(
                    width: 7,
                    gradient: LinearGradient(
                      colors: [
                        Constants.backgroundColor,
                        Colors.transparent,
                        Colors.white.withOpacity(0.3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6, 0.9, 0.9],
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      offset: Offset(1, 1),
                      blurRadius: 100,
                      spreadRadius: 50,
                    ),
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(7, 9),
                      blurRadius: 10,
                      spreadRadius: -1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        alignment: AlignmentDirectional.bottomCenter,
      ),
    );
  }
}
