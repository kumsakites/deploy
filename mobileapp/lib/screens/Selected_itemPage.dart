import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';

class SelectedItemPage extends StatefulWidget {
  final bool isActionSelected;
  final bool isComedySelected;

  SelectedItemPage({
    Key? key,
    required this.isActionSelected,
    required this.isComedySelected,
  }) : super(key: key);

  @override
  State<SelectedItemPage> createState() => _SelectedItemPageState();
}

class _SelectedItemPageState extends State<SelectedItemPage> {
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
          title: Text(
            'Movie Interest'.tr,
            style: TextStyle(
              color: currentTheme.colorScheme.onBackground,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: currentTheme.colorScheme.background,
        ),
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                TabBar(
                  dividerColor: Styles.kback,
                  tabs: [
                    Tab(
                      child: Text('Watched'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontSize: 20)),
                    ),
                    Tab(
                      child: Text('New'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontSize: 20)),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            if (widget.isActionSelected ||
                                widget.isComedySelected)
                              GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8.0,
                                  crossAxisSpacing: 8.0,
                                ),
                                itemCount:
                                    4, // Change the itemCount as per your requirement
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              'images/cinema.png',
                                              width:
                                                  GetSize.getScreenWidthDevice(
                                                      100),
                                              height:
                                                  GetSize.getScreenHeightDevice(
                                                      100),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  GetSize.getScreenHeightDevice(
                                                      5)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.yellow.shade900,
                                              ),
                                              SizedBox(
                                                  width: GetSize
                                                      .getScreenWidthDevice(5)),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.yellow.shade900,
                                              ),
                                              SizedBox(
                                                  width: GetSize
                                                      .getScreenWidthDevice(5)),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.yellow.shade900,
                                              ),
                                              SizedBox(
                                                  width: GetSize
                                                      .getScreenWidthDevice(5)),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.yellow.shade900,
                                              ),
                                              SizedBox(
                                                  width: GetSize
                                                      .getScreenWidthDevice(5)),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.yellow.shade900,
                                              ),
                                              SizedBox(
                                                  width: GetSize
                                                      .getScreenWidthDevice(5)),
                                            ],
                                          ),
                                          Text(
                                            'Comedy'.tr,
                                            style: TextStyle(
                                              color: currentTheme
                                                  .colorScheme.onBackground,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            SizedBox(height: GetSize.getScreenHeightDevice(40)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: GetSize.getScreenHeightDevice(40)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
