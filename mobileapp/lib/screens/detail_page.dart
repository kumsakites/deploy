import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../provider/booking_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'Review_Summary.dart';

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    final bookingProvider = Get.find<BookingProvider>();
    final selectedMovie = bookingProvider.selectedMovie;

    // Convert asset path to Image widget
    Image selectedMovieImage = Image.asset(
      selectedMovie.imageUrl,
      width: double.infinity,
      height: GetSize.getScreenHeightDevice(150),
      fit: BoxFit.cover,
    );
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
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: GetSize.getScreenHeightDevice(200),
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      selectedMovie.imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Coming of the robot".tr,
                            style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontFamily: 'Roboto',
                                fontSize: 21),
                          ),
                          SizedBox(
                            height: GetSize.getScreenHeightDevice(8),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildRatingBar(selectedMovie.rating),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewSummary(
                                        imageUrl: selectedMovie.imageUrl,
                                        imageWidget: selectedMovieImage,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Styles.kbtc // primary: Colors.blue,
                                    ),
                                child: Text(
                                  'Watch'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
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
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenWidthDevice(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Genre'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontSize: 21)),
                      Text('Action, Sci-fi'.tr, style: Styles.headLineStyle3),
                      SizedBox(
                        height: GetSize.getScreenHeightDevice(8),
                      ),
                      Text('Price'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontSize: 21)),
                      Text('250/seat'.tr, style: Styles.headLineStyle3),
                      SizedBox(
                        height: GetSize.getScreenHeightDevice(8),
                      ),
                      Text('Showtime'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontSize: 21)),
                      _buildShowtime('10:30 pm-12:00 pm at Alem cinema',
                          style: Styles.headLineStyle3),
                      _buildShowtime('9:30 pm-11:00 pm at Ednamol cinema',
                          style: Styles.headLineStyle3),
                      _buildShowtime('3:20 am-11:00 am at At cinema',
                          style: Styles.headLineStyle3),
                      SizedBox(
                        height: GetSize.getScreenHeightDevice(8),
                      ),
                      Text('Description'.tr,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: currentTheme.colorScheme.onBackground,
                              fontSize: 21)),
                      Text(
                        'In a not-so-distant future, society teeters on the brink of chaos as a brilliant scientist unleashes a groundbreaking artificial intelligence. A task force is deployed to control the evolving situation. What ensues is a high-stakes game of cat and mouse, where humanity\'s fate hangs in the balance.'
                            .tr,
                        style: Styles.headLineStyle3,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBar(double rating) {
    return RatingBar.builder(
      initialRating: rating,
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
        // Do somethying with the rating
      },
    );
  }

  Widget _buildShowtime(String time, {TextStyle? style}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: style ?? Styles.headLineStyle2,
        ),
        SizedBox(
          height: GetSize.getScreenHeightDevice(4),
        ),
      ],
    );
  }
}
