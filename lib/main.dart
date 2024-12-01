import 'package:chat_app/core/services/navigation_services.dart';
import 'package:chat_app/features/auth/preentation/screens/login_screen.dart';
import 'package:chat_app/features/auth/preentation/screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

import 'core/constants/values/size_configration.dart';
import 'features/auth/preentation/provider/auth_provider.dart';
import 'firebase_options.dart';

void main() async{

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        SizeConfig().init(context);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthenticationProvider>(
              create: (BuildContext context) {
                return AuthenticationProvider();
              },
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chat App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(36, 35, 49, 1.5),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
              ),
            ),
            navigatorKey: NavigationService.navigatorKey,
            initialRoute: '/login',
            routes: {
              '/login': (BuildContext context) => const LoginScreen(),
            },
            home:  SplashScreen(onInitlizationComplete: (){

            },),
          ),
        );
      }

    );
  }
}



