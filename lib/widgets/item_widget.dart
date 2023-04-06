import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:futuristic_ui/screens/item_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.width,
    required this.imagePath,
    required this.title,
  });

  double width;
  String imagePath;
  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
            ),
            width: width / 2.3,
            margin: EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Positioned(
                  top: -25,
                  right: -30,
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('images/$imagePath.png')),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          title.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        lorem(paragraphs: 1, words: 10),
                        style: GoogleFonts.montserrat(
                          color: Constants.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemScreen(
                imagePath: imagePath,
                title: title,
              ),
            ));
      },
    );
  }
}
