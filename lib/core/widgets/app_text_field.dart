import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  String? Function(String?)? validator;
  final Color fillColor;
  bool? showPassword;
  void Function(String)? onChanged;
  final Widget? leading;

   AppTextField({
     super.key,
     required this.controller,
     required this.hint,
     required this.validator,
     this.showPassword,
     this.fillColor = const Color.fromRGBO(30, 29, 37, 1.0),
     this.onChanged,
     this.leading,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: showPassword != null ? !showPassword! : false,
        validator: validator ??
                (String? newVal) {
              return null;
            },
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: leading,
        ),
      ),
    );
  }
}
