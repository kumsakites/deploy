import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketing/screens/home_screen.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/dark_theme.dart';
import 'package:ticketing/utils/getSize.dart';
import 'package:ticketing/utils/light_theme.dart';

import 'Localization/localStrings.dart';
import 'provider/booking_provider.dart';
import 'provider/theme_provider.dart';

void main() async{
  WidgetsFlutterBinding
      .ensureInitialized();
       SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themeBool = prefs.getBool("isDark") ?? false; //null check
  
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeProvider(),
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final BookingProvider bookingProvider = BookingProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
          
            darkTheme: darkTheme,
            translations: LocalString(),
            locale: Locale("en", "US"),
            home: SplashScreen(),
            initialBinding: BindingsBuilder(() {
              Get.put(bookingProvider);
            }),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cinema.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: themeProvider.theme.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Text(
                'Yeha Technology Cinema production'.tr,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
