import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'watch_movie_page.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({Key? key}) : super(key: key);

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class Cinema {
  final String name;
  final String imagePath;
  final String distance;

  Cinema({
    required this.name,
    required this.imagePath,
    required this.distance,
  });
}

class _CinemaPageState extends State<CinemaPage> {
  final List<Cinema> cinemas = [
    Cinema(
        name: "Ethio Cinema".tr,
        imagePath: "images/cinema.png",
        distance: "200 meters away".tr),
    Cinema(
        name: "Second Cinema".tr,
        imagePath: "images/cinema.png",
        distance: "300 meters away".tr),
    // Add more cinema data as needed
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenWidthDevice(15)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: GetSize.getScreenWidthDevice(15),
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/where.jpg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(40)),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: GetSize.getScreenWidthDevice(20),
                        vertical: GetSize.getScreenHeightDevice(20),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Discover movies and \nbook tickets".tr,
                          style: TextStyle(
                            color: currentTheme.colorScheme.onBackground,
                            fontSize: MediaQuery.of(context).size.width *
                                0.08, // Adjust the multiplier as needed
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: GetSize.getScreenHeightDevice(10),
                      horizontal: GetSize.getScreenWidthDevice(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: GetSize.getScreenWidthDevice(15),
                      ),
                      decoration: BoxDecoration(
                        color: Styles.ksf,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'enter movie or cinema',
                            hintStyle: TextStyle(
                              color: Styles.ktsf,
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.search,
                                  color: Styles.ktsf,
                                )),
                            suffixIcon: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: Styles.ktsf,
                                ))),
                      ),
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Nearby cinema'.tr,
                      style: Styles.headLineStyle3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cinemas.length,
                          itemBuilder: (BuildContext context, int index) {
                            Cinema cinema = cinemas[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WatchMoviePage(
                                            cinema: cinemas[index])));
                              },
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(cinema.imagePath,
                                          width:
                                              GetSize.getScreenWidthDevice(200),
                                          height: GetSize.getScreenHeightDevice(
                                              200),
                                          fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                      bottom: 8.0,
                                      left: 8.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(cinema.name,
                                              style: Styles.headLineStyle2),
                                          Text(cinema.distance,
                                              style: Styles.headLineStyle4),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8.0,
                                      right: 8.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Handle "More" button tap for the cinema
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  GetSize.getScreenWidthDevice(
                                                      15)),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                5), // Optional: Add border radius for the "More" button
                                          ),
                                          child: Center(
                                            child: Text(
                                              'More'.tr,
                                              style: TextStyle(
                                                color: currentTheme
                                                    .colorScheme.onBackground,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: GetSize.getScreenWidthDevice(15)),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("Genres".tr,
                              style: Styles.headLineStyle3,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: GetSize.getScreenWidthDevice(20)),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            splashColor: Styles.kakiColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Ink.image(
                                    image: AssetImage('images/com.jpg'),
                                    height: GetSize.getScreenHeightDevice(50),
                                    width: GetSize.getScreenWidthDevice(50),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                    height: GetSize.getScreenHeightDevice(10)),
                                Text("Comedy".tr, style: Styles.headLineStyle3),
                              ],
                            ),
                          ),
                          SizedBox(width: GetSize.getScreenWidthDevice(20)),
                          InkWell(
                            onTap: () {},
                            splashColor: Styles.kakiColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Ink.image(
                                    image: AssetImage('images/fantasy.jpg'),
                                    height: GetSize.getScreenHeightDevice(50),
                                    width: GetSize.getScreenWidthDevice(50),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                    height: GetSize.getScreenHeightDevice(10)),
                                Text("Fantasy".tr,
                                    style: Styles.headLineStyle3),
                              ],
                            ),
                          ),
                          SizedBox(width: GetSize.getScreenWidthDevice(20)),
                          InkWell(
                            onTap: () {},
                            splashColor: Styles.kakiColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Ink.image(
                                    image: AssetImage('images/action.jpg'),
                                    height: GetSize.getScreenHeightDevice(50),
                                    width: GetSize.getScreenWidthDevice(50),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                    height: GetSize.getScreenHeightDevice(10)),
                                Text("Action".tr, style: Styles.headLineStyle3),
                              ],
                            ),
                          ),
                          SizedBox(width: GetSize.getScreenWidthDevice(20)),
                          InkWell(
                            onTap: () {},
                            splashColor: Styles.kakiColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Ink.image(
                                    image: AssetImage('images/horor.jpg'),
                                    height: GetSize.getScreenHeightDevice(50),
                                    width: GetSize.getScreenWidthDevice(50),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                    height: GetSize.getScreenHeightDevice(10)),
                                Text("Horror".tr, style: Styles.headLineStyle3),
                              ],
                            ),
                          ),
                          SizedBox(width: GetSize.getScreenWidthDevice(20)),
                          InkWell(
                            onTap: () {},
                            splashColor: Styles.kakiColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Ink.image(
                                    image: AssetImage('images/ethip.jpg'),
                                    height: GetSize.getScreenHeightDevice(50),
                                    width: GetSize.getScreenWidthDevice(50),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                    height: GetSize.getScreenHeightDevice(10)),
                                Text("Documentary".tr,
                                    style: Styles.headLineStyle3),
                              ],
                            ),
                          ),
                          SizedBox(width: GetSize.getScreenWidthDevice(20)),
                          // Add more genres as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(120)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
