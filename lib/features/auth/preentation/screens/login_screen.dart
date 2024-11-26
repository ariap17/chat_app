import 'package:chat_app/core/constants/values/size_configration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(),
          ],
        ),
      ),
    );
  }
}

Widget _pageTitle() {
  return Container(
    height: 108.h,
    child: const Text(
      'ChatApp',
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}