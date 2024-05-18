import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/provider/theme_provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../utils/app_styles.dart';
import 'Choose_payment_method.dart';
import 'Food_detail_page.dart';

class FoodItem {
  final String imagePath;
  final String description;
  final String price;

  FoodItem({
    required this.imagePath,
    required this.description,
    required this.price,
  });
}

class FoodOrderPage extends StatefulWidget {
  const FoodOrderPage({Key? key}) : super(key: key);

  @override
  State<FoodOrderPage> createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  List<FoodItem> mostPopularItems = [
    FoodItem(
        imagePath: 'images/popcorn.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/popcorn.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/popcorn.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/popcorn.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/popcorn.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    // Add more items as needed
  ];

  List<FoodItem> burgerAndChipsItems = [
    FoodItem(
        imagePath: 'images/coca.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/coca.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/coca.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/coca.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    FoodItem(
        imagePath: 'images/coca.jpg',
        description: 'Jumbo Popcorn'.tr,
        price: '100 birr'),
    // Add more items as needed
  ];

  void navigateToNextPage(FoodItem foodItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(foodItem: foodItem),
      ),
    );
  }

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
          title: Text(
            "Food and Order".tr,
            style: TextStyle(
                color: currentTheme.colorScheme.onBackground,
                fontFamily: 'Roboto',
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenWidthDevice(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Popular'.tr,
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground,
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text('View All'.tr,
                              style: TextStyle(
                                  color:
                                      currentTheme.colorScheme.onBackground)),
                          Icon(Icons.arrow_forward_ios,
                              color: currentTheme.colorScheme.onBackground),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      mostPopularItems.length,
                      (index) => Column(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateToNextPage(mostPopularItems[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: GetSize.getScreenWidthDevice(20)),
                              child: Container(
                                width: GetSize.getScreenWidthDevice(150),
                                height: GetSize.getScreenHeightDevice(150),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        mostPopularItems[index].imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mostPopularItems[index].description,
                                  style: Styles.headLineStyle3),
                              Text(mostPopularItems[index].price,
                                  style: Styles.headLineStyle3),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenWidthDevice(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Burger and Chips'.tr,
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground,
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text('View All'.tr,
                              style: TextStyle(
                                  color:
                                      currentTheme.colorScheme.onBackground)),
                          Icon(Icons.arrow_forward_ios,
                              color: currentTheme.colorScheme.onBackground),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      burgerAndChipsItems.length,
                      (index) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                navigateToNextPage(burgerAndChipsItems[index]);
                              },
                              child: Container(
                                width: GetSize.getScreenWidthDevice(150),
                                height: GetSize.getScreenHeightDevice(150),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        burgerAndChipsItems[index].imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(8)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(burgerAndChipsItems[index].description,
                                    style: Styles.headLineStyle3),
                                Text(burgerAndChipsItems[index].price,
                                    style: Styles.headLineStyle3),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenWidthDevice(25)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentMethod()),
                      );
                    },
                    child: Container(
                      height: GetSize.getScreenHeightDevice(40),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text('Continue'.tr,
                              style: TextStyle(
                                  color: currentTheme.colorScheme.onBackground,
                                  fontSize: 18))),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
