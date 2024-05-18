import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ticketing/screens/cinema_page.dart';
import 'package:ticketing/utils/getSize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/booking_provider.dart';
import '../utils/app_styles.dart';
import '../utils/dark_theme.dart';
import '../utils/light_theme.dart';

class WatchMoviePage extends StatefulWidget {
  bool isFavorite = false;
    bool isDarkMode = false;
  final Cinema cinema;
  WatchMoviePage({required this.cinema});
  @override
  State<WatchMoviePage> createState() => _WatchMoviePageState();
}

class _WatchMoviePageState extends State<WatchMoviePage> {
    bool showAdditionalInfo = false;
     late String selectedMovieImage;
    


  @override
  void initState() {
    super.initState();
    final bookingProvider = Get.find<BookingProvider>();
    selectedMovieImage = bookingProvider.selectedMovie.imageUrl;
        selectedMovieImage = widget.cinema.imagePath; 
  }

  void toggleInfoVisibility() {
    setState(() {
      showAdditionalInfo = !showAdditionalInfo;
    });
  }
   TextEditingController _controller = TextEditingController();

  List<String> comments = [];

  void _addComment() {
    setState(() {
      comments.add(_controller.text);
      _controller.clear();
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(comments[index]),
        );
      },
    );
  }

  TextField _buildCommentTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
      fillColor: Colors.white, 
        hintText: 'Write a comment'.tr,
        border: OutlineInputBorder(),
        
      ),
    );
  }

  Row _buildSendButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
                      onTap: () {
                        
                      },
                      child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/kumsa.jpg'),
                        ),
                    ),
        Container(
           decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10.0),  // Set the desired border radius
  ),
          
          
          child: TextButton(
            onPressed: _addComment,
            style: TextButton.styleFrom(
              // Set the background color
          ),
            child: Text('Send'.tr,style: TextStyle(color: Styles.textColor,fontSize: 20),),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = widget.isDarkMode ? darkTheme : lightTheme;
    return Scaffold(
       
      backgroundColor: Styles.kback,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Styles.btntColor,
        ),
        backgroundColor: Styles.kback,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  
                  children: [
                    InkWell(
                      onTap: () {
                        
                      },
                      child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/where.jpg'),
                        ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(30),),
                    Column(
                      children: [
                        Text(
                          'Alem Cinema'.tr,
                          style: Styles.headLineStyle2,
                        ),
                        Text(
                      'The trending cinema in Addis'.tr,
                      style: TextStyle(color: Styles.btntColor),
                    ),
                    SizedBox(height: GetSize.getScreenHeightDevice(10),),
                     Row(
                    children: [
                      
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          });
                        },
                        child: Icon(
                          widget.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: widget.isFavorite ? Colors.red : Styles.textColor,
                        ),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(20)),
                      Text(
                        'Add to fav cinema'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      
                    ],
                  ),
              
                      ],
                    ),
                     
                  ],
                ),
              ),
             
              SizedBox(height: GetSize.getScreenHeightDevice(16)),
           
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
            Column(
              children: [
                Row(
                  children: [
                    Text('4.5', style: Styles.headLineStyle3),
                     RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1, // Set itemCount to 1
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        onRatingUpdate: (rating) {
                          // You can handle the rating update here if needed
                        },
                      ),
                  ],
                ),
               Text('2M reviews'.tr, style: Styles.headLineStyle3),
              ],
            ),
                   SizedBox(width: GetSize.getScreenWidthDevice(15),),
             Column(
              children: [
                Row(
                  children: [
                    Text('4.5', style: Styles.headLineStyle3),
                     RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1, // Set itemCount to 1
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        onRatingUpdate: (rating) {
                          // You can handle the rating update here if needed
                        },
                      ),
                  ],
                ),
               Text('2M reviews'.tr, style: Styles.headLineStyle3),
              ],
            ),
                   SizedBox(width: GetSize.getScreenWidthDevice(15),),
            Column(
              children: [
                Row(
                  children: [
                    Text('4.5', style: Styles.headLineStyle3),
                     RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1, // Set itemCount to 1
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        onRatingUpdate: (rating) {
                          // You can handle the rating update here if needed
                        },
                      ),
                  ],
                ),
               Text('2M reviews'.tr, style: Styles.headLineStyle3),
              ],
            ),
                   SizedBox(width: GetSize.getScreenWidthDevice(15),),
                  ],
                ),
                
                
               
              ],
            ),
          ),
          SizedBox(height: GetSize.getScreenHeightDevice(20),),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
          // Add your functionality for the "Upcoming Show" button here
                },
                style: ElevatedButton.styleFrom(
          // primary: Colors.blue,
          backgroundColor: Styles.kbtc,
          // onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
          ),
                ),
                child: Text('Upcoming Show'.tr,style: TextStyle(fontFamily: 'Roboto',color: Styles.textColor),textAlign: TextAlign.center,),
              ),
             SizedBox(width: GetSize.getScreenWidthDevice(16),),
              ElevatedButton(
                onPressed: () {
          // Add your functionality for the "Today" button here
                },
                style: ElevatedButton.styleFrom(
        backgroundColor: Styles.kbtn,
          // onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
          ),
                ),
                child: Text('Today'.tr,style: TextStyle(fontFamily: 'Roboto',color: Styles.textColor),textAlign: TextAlign.center,),
              ),
            ],
          ),
          SizedBox(height: GetSize.getScreenHeightDevice(30),),
         ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Image.asset(
    selectedMovieImage,
    width: double.infinity,
    height: GetSize.getScreenHeightDevice(150),
    fit: BoxFit.cover,
  ),
),

              SizedBox(height: GetSize.getScreenHeightDevice(20),),
              Column(
                children: [
                  Text('10:30 PM - 12:PM at\n Alem Cinema'.tr, style: Styles.headLineStyle3,),
                
                ],
              ),

           
              Text('About Alem Cinema'.tr, style: Styles.headLineStyle2),
              SizedBox(height: GetSize.getScreenHeightDevice(8)),
              Text(
                'Welcome to Alem Cinema, a cinematic haven nestled in the heart of Ethiopia, where the magic of storytelling comes to life on the big screen. Alem Cinema stands as a beacon of entertainment, seamlessly blending modernity with Ethiopian cultural richness, offering an immersive cinematic experience like no other.\nAs you step through the doors of Alem Cinema, you are welcomed by an inviting ambiance that reflects the warmth and vibrancy of Ethiopian hospitality.'.tr,
                style: Styles.headLineStyle3,
                textAlign: TextAlign.justify,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    // Load More TextButton
                    TextButton(
                      onPressed: () {
                        toggleInfoVisibility();
                      },
                       child: Text(
                        showAdditionalInfo ? 'Show Less'.tr : 'Load More'.tr ,style: Styles.headLineStyle2,
                      ),
                    ),
                          
                    // Additional Information
                    if (showAdditionalInfo)
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                             SizedBox(height: GetSize.getScreenHeightDevice(10),),
                            Text('Come Visit Us'.tr,style: TextStyle(color: Styles.textColor,fontSize: 20)),
                              SizedBox(height: GetSize.getScreenHeightDevice(10),),
                           Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Styles.textColor,
                                  ),
                                  SizedBox(width: GetSize.getScreenWidthDevice(8),), // Adjust the spacing as needed
                                  Text(
                                    'XQRP+68P, Airport Road, Addis Ababa'.tr,
                                    style: TextStyle(color: Styles.textColor),
                                  ),
                                ],
                              ),
                            SizedBox(height: GetSize.getScreenHeightDevice(10),),
                            Row(
                              children: [
                                 Icon(
                                      Icons.language,
                                      color: Styles.textColor,
                                    ),
                                    SizedBox(width: GetSize.getScreenWidthDevice(8)),
                                GestureDetector(
                                  onTap: (){
                                    launch('http://www.alemcinema.com/');
                                  },
                                  child: Text('Check our official Page'.tr, style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                  ),
                                  )
                                  ),
                              ],
                            ),
                                                    SizedBox(height: GetSize.getScreenHeightDevice(10),),
                            Row(
                              
                              children: [
                                 Icon(
                                      Icons.phone,
                                      color: Styles.textColor,
                                    ),
                                    SizedBox(width: GetSize.getScreenWidthDevice(8)),
                                Text('0917534343',style: TextStyle(color: Styles.textColor),),
                              ],
                            ),
                             SizedBox(height: GetSize.getScreenHeightDevice(10),),
                            Row(
                              children: [
                                Icon(
                                      Icons.login,
                                      color: Styles.textColor,
                                    ),
                                    SizedBox(width: GetSize.getScreenWidthDevice(8)),
                                Text('Send to your phone'.tr,style: TextStyle(color: Styles.textColor),),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(10),),
                            Row(
                              children: [
                                Icon(
                                      Icons.people,
                                      color: Styles.textColor,
                                    ),
                                    SizedBox(width: GetSize.getScreenWidthDevice(8)),
                                Text('What people say about us'.tr,style: TextStyle(color: Styles.textColor),),
                
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20),),
                          
                          ],
                        ),
                      ),
                  ],
                ),
              ),
             Text('Rate Our Cinema'.tr,style: Styles.headLineStyle2),
                                    SizedBox(height: GetSize.getScreenHeightDevice(10),),
                        Text('Tell others what you think'.tr,style: Styles.headLineStyle3,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  RatingBar.builder(
                                        initialRating: 5, // Set the initial rating value
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false, // Set this to true if you want to allow half ratings
                                        itemCount: 5,
                                        itemSize: 30,
                                        tapOnlyMode: true, // Set this to true to make the RatingBar unselectable by default
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            Icons.star,
                                            color: index < 5 ? Colors.yellow : Colors.grey,
                                          );
                                        },
                                        onRatingUpdate: (rating) {
                                          // Handle the selected rating here
                                          // You can update your state or perform other actions based on the selected rating
                                        },
                                      ),

                                      ],
                                    ),

                                    Text('Rating and reviews are verified and are from people who use the service'.tr,style: Styles.headLineStyle3,textAlign: TextAlign.justify,),
                                    SizedBox(height: GetSize.getScreenHeightDevice(15),),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                          Text('4.5',style: Styles.headLineStyle1,),
                                            RatingBar.builder(
                                        initialRating: 5, // Set the initial rating value
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false, // Set this to true if you want to allow half ratings
                                        itemCount: 5,
                                        itemSize: 10,
                                        tapOnlyMode: true, // Set this to true to make the RatingBar unselectable by default
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            Icons.star,
                                            color: index < 5 ? Colors.yellow : Colors.grey,
                                          );
                                        },
                                        onRatingUpdate: (rating) {
                                          // Handle the selected rating here
                                          // You can update your state or perform other actions based on the selected rating
                                        },
                                      ),
                                      Text('2,256,896',style: Styles.headLineStyle4,),
                                          ],
                                        ),
                                        SizedBox(width: GetSize.getScreenWidthDevice(30),),
                                     Column(
                                       children: [
                                         Row(
                                           children: [
                                            Text('5',style: TextStyle(color: Styles.textColor),),
                                             LinearPercentIndicator(
                                                  width: GetSize.getScreenWidthDevice(150),
                                                  animation: true,
                                                  lineHeight: 8,
                                                  animationDuration: 2500,
                                                  percent: 0.8,
                                                                                 
                                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                                  progressColor: Colors.blue, // Set the color for the percentage covered
                                                  backgroundColor: Colors.white, // Set the color for the percentage uncovered
                                                ),
                                           ],
                                         ),
                                            
                                            Row(
                                              children: [
                                                Text('4',style: TextStyle(color: Styles.textColor),),
                                                LinearPercentIndicator(
                                                                                          width: GetSize.getScreenWidthDevice(150),
                                                                                          animation: true,
                                                                                          lineHeight: 8,
                                                                                          animationDuration: 2500,
                                                                                          percent: 0.6,
                                                                                    
                                                                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                                                                          progressColor: Colors.blue, // Set the color for the percentage covered
                                                                                          backgroundColor: Colors.white, // Set the color for the percentage uncovered
                                                                                        ),
                                              ],
                                            ),
                                        
                                        Row(
                                          children: [
                                            Text('3',style:TextStyle(color: Styles.textColor),),
                                            LinearPercentIndicator(
                                              width: GetSize.getScreenWidthDevice(150),
                                              animation: true,
                                              lineHeight: 8,
                                              animationDuration: 2500,
                                              percent: 0.4,
                                                                                
                                              linearStrokeCap: LinearStrokeCap.roundAll,
                                              progressColor: Colors.blue, // Set the color for the percentage covered
                                              backgroundColor: Colors.white, // Set the color for the percentage uncovered
                                            ),
                                          ],
                                        ),
                                        
                                        Row(
                                          children: [
                                            Text('2',style: TextStyle(color: Styles.textColor),),
                                            LinearPercentIndicator(
                                              width: GetSize.getScreenWidthDevice(150),
                                              animation: true,
                                              lineHeight: 8,
                                              animationDuration: 2500,
                                              percent: 0.2,
                                                                                
                                              linearStrokeCap: LinearStrokeCap.roundAll,
                                              progressColor: Colors.blue, // Set the color for the percentage covered
                                              backgroundColor: Colors.white, // Set the color for the percentage uncovered
                                            ),
                                          ],
                                        ),
                                        
                                        Row(
                                          children: [
                                            Text('1',style: TextStyle(color: Styles.textColor),),
                                            LinearPercentIndicator(
                                              width: GetSize.getScreenWidthDevice(150),
                                              animation: true,
                                              lineHeight: 8,
                                              animationDuration: 2500,
                                              percent: 0.1,
                                                                                
                                              linearStrokeCap: LinearStrokeCap.roundAll,
                                              progressColor: Colors.blue, // Set the color for the percentage covered
                                              backgroundColor: Colors.white, // Set the color for the percentage uncovered
                                            ),
                                          ],
                                        ),
                                       ],
                                     ),
                                        
                                                                              ],
                                    ),
                                  TextButton(onPressed: () {  },
                                  child: Text("Write a review".tr, style: TextStyle(color: Styles.btntColor),)),
                                  SizedBox(height: GetSize.getScreenHeightDevice(16)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildCommentTextField(),
                                    SizedBox(height: 16),
                                    _buildSendButton(),
                                    SizedBox(height: 16),
                                    _buildCommentList(),
                                  ],
                                ),
                                                            
           ],
          ),
        ),
      ),
    );
  }
}
