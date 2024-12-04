import 'package:chat_app/core/widgets/app_text_field.dart';
import 'package:chat_app/features/auth/preentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/navigation_services.dart';
import '../../../../core/util/validator.dart';
import '../provider/auth_provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late AuthenticationProvider _auth;
  late NavigationService _navigation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {

    _auth = Provider.of<AuthenticationProvider>(context);
    // _navigation = GetIt.instance.get<NavigationService>();

    return  Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _pageTitle(),
                  SizedBox(height: 40.h,),
                  AppTextField(
                    controller: _emailController,
                    hint: 'Email',
                    validator: (String? value) => Validator.email(value),
                  ),
                  SizedBox(height: 20.h,),
                  AppTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    validator: (String? value) => Validator.defaultValidator(value),
                  ),
                  SizedBox(height: 40.h,),
                  LoginButton(
                      title: 'Login',
                      onTap: (){} ),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}

Widget _pageTitle() {
  return SizedBox(
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