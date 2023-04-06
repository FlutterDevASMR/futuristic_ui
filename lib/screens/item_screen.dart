import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:futuristic_ui/utils/background_part.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({
    super.key,
    required this.imagePath,
    required this.title,
  });

  String imagePath;
  String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        BackgroundPart(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/$imagePath.png'),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.4),
                        Color(0xff2f3147),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.01, 0.5],
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height / 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Constants.iconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: Constants.backgroundColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Constants.iconColor,
                                      offset: Offset(0, 2),
                                      blurRadius: 20,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.3),
                                      Constants.backgroundColor,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.1, 0.6],
                                  ),
                                ),
                                padding: EdgeInsets.all(3),
                              ),
                            ),
                            Spacer(),
                            Stack(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Constants.backgroundColor,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: CircleAvatar(
                                        foregroundImage: AssetImage(
                                          'images/usa.png',
                                        ),
                                        backgroundColor: Colors.transparent,
                                        radius: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              title.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                color: Constants.textColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              lorem(paragraphs: 1, words: 1).toUpperCase(),
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          lorem(paragraphs: 2, words: 60),
                          style: GoogleFonts.montserrat(
                            color: Constants.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
