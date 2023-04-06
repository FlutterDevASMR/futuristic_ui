import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:futuristic_ui/utils/constants.dart';
import 'package:futuristic_ui/widgets/category_widget.dart';
import 'package:futuristic_ui/widgets/item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['HELMET', 'GRENADE', 'GUN'];

  List<String> imageCategory = ['helmet', 'grenade', 'gun'];

  int selectedCategoryItem = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey.shade800,
                  width: 1,
                ),
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: HomeAppBar(width: width, height: height),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 40),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: height / 3.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryItem = index;
                          });
                        },
                        child: CategoryWidget(
                          width: width,
                          title: categories[index],
                          imagePath: imageCategory[index],
                          index: index,
                          selectedIndex: selectedCategoryItem,
                        ),
                      ),
                      itemCount: categories.length,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 15),
              ),
              SliverPadding(
                padding: EdgeInsets.only(left: 40),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: height / 3.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String imagepath = 'helmet${index + 1}';

                        switch (selectedCategoryItem) {
                          case 0:
                            imagepath = 'helmet${index + 1}';
                            break;
                          case 1:
                            imagepath = 'grenade${index + 1}';
                            break;

                          case 2:
                            imagepath = 'gun${index + 1}';
                        }
                        return ItemWidget(
                          width: width,
                          imagePath: imagepath,
                          title: lorem(paragraphs: 1, words: 1),
                        );
                      },
                      itemCount: 2,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.4),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.01, 0.5],
        ),
        image: DecorationImage(
          image: AssetImage('images/banner_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 40),
        child: Column(
          children: [
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Icon(
                      Icons.settings_rounded,
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
                ],
              ),
            ),
            SizedBox(height: height / 20),
            Row(
              children: [
                Text(
                  'HERE IS',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset('images/future.png'),
              ],
            ),
            SizedBox(height: height / 4.8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'EQUIPMENT',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: width / 2 - 10,
                      color: Constants.blueColor,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
