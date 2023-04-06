import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:futuristic_ui/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({
    super.key,
    required this.width,
    required this.title,
    required this.imagePath,
    required this.index,
    required this.selectedIndex,
  });

  double width;
  String title;
  String imagePath;

  int index;
  int selectedIndex;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            border: Border(
              bottom: BorderSide(
                color: widget.selectedIndex == widget.index
                    ? Constants.blueColor
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          width: widget.width / 2.3,
          margin: EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              Positioned(
                top: -25,
                right: -30,
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child:
                        Image.asset('images/${widget.imagePath}_category.png')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 13,
                        color: widget.selectedIndex == widget.index
                            ? Constants.blueColor
                            : Colors.transparent,
                      ),
                      SizedBox(width: 10 - 3),
                      Text(
                        widget.title,
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
    );
  }
}
