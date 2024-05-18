import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../provider/booking_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'detail_page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> containerTexts = [
    'Coming of the robot'.tr,
    'In to the purple'.tr,
    'Green the grinch'.tr,
    'little the red boot'.tr,
    'Dino dog'.tr,
    'Freaky flamingo'.tr,
  ];

  List<String> containerImages = [
    'images/cenema.png',
    'images/news.png',
    'images/com.jpg',
    'images/comedy.jpg',
    'images/fantasy.jpg',
    'images/horor.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Scaffold(
        backgroundColor: currentTheme.colorScheme.background,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: currentTheme.colorScheme.onBackground,
          ),
          backgroundColor: currentTheme.colorScheme.background,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: GetSize.getScreenWidthDevice(15)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenWidthDevice(15)),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: currentTheme.colorScheme.background,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                    color: Color.fromRGBO(204, 212, 225, 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    style:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // filled: true,
                      // fillColor: Colors.white70,
                      hintText: 'enter movie'.tr,
                      labelStyle: TextStyle(
                          color: currentTheme.colorScheme.onBackground),
                      hintStyle: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                      ),
                      prefixIcon: Icon(Icons.search,
                          color: currentTheme.colorScheme.onBackground),
                    ),
                  ),
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                _buildRowOfContainers(0),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(120),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowOfContainers(int startIndex) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Animation'.tr,
                    style: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                        fontFamily: 'Roboto',
                        fontSize: 21)),
              ],
            ),
            SizedBox(
              height: GetSize.getScreenHeightDevice(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContainer(startIndex),
                _buildContainer(startIndex + 1),
              ],
            ),
            SizedBox(
              height: GetSize.getScreenHeightDevice(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContainer(startIndex + 2),
                _buildContainer(startIndex + 3),
              ],
            ),
            SizedBox(
              height: GetSize.getScreenHeightDevice(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContainer(startIndex + 4),
                _buildContainer(startIndex + 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(int index) {
    return GestureDetector(
      onTap: () {
        Get.find<BookingProvider>().setSelectedMovie(
          containerTexts[index],
          containerImages[index],
          4.5,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(index: index),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        constraints: BoxConstraints(
            maxWidth:
                GetSize.getScreenWidthDevice(120)), // Limit container width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: GetSize.getScreenWidthDevice(100),
              height: GetSize.getScreenHeightDevice(100),
              child: Image.asset(
                containerImages[index],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: GetSize.getScreenHeightDevice(8),
            ),
            _buildRatingBar(),
            SizedBox(
              height: GetSize.getScreenHeightDevice(8),
            ),
            Text(
              containerTexts[index],
              style: Styles.headLineStyle3,
              maxLines: 2, // Limit text to 2 lines
              overflow: TextOverflow.ellipsis, // Add overflow handling
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar() {
    return RatingBar.builder(
      initialRating: 4.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20.0,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // Do something with the rating
      },
    );
  }
}
