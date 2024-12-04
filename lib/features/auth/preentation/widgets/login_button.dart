import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const LoginButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 200.w ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color.fromRGBO(0, 82, 218, 1.0,),
      ),
      child: TextButton(
        onPressed: onTap,
          child: Text(title, style: const TextStyle(fontSize: 22,
              color: Colors.white,
            height: 1.5
          ),),
      ),
    );
  }
}
