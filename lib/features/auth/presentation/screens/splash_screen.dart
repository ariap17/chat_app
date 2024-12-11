

import 'package:chat_app/core/constants/values/size_configration.dart';
import 'package:chat_app/core/services/cloud_storage_services.dart';
import 'package:chat_app/core/services/database_services.dart';
import 'package:chat_app/core/services/media_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/services/navigation_services.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitlizationComplete;

   const SplashScreen({super.key,
     required this.onInitlizationComplete,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
        (_){
          _setup().then((_)=> widget.onInitlizationComplete(),
          );
        },
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
     body: Center(
       child: Container(
         height: 200.h,
         width: 200.w,
         decoration: const BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/splash.png'),
             fit: BoxFit.contain,
           ),
         ),
       ),
     ),
    );
  }

  Future<void> _setup() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }


  void _registerServices() {

    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );

    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );

    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );

    GetIt.instance.registerSingleton<DatabaseService>(
      DatabaseService(),
    );
  }
}
