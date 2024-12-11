import 'dart:developer';

import 'package:chat_app/features/auth/domain/entities/response/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/services/database_services.dart';
import '../../../../core/services/navigation_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;

  late ChatUser user;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    // _auth.signOut();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.updateUserLastSeenTime(_user.uid);
        _databaseService.getUser(_user.uid).then((snapshot){
          Map<String, dynamic> userData =
          snapshot.data()! as Map<String, dynamic>;
          user = ChatUser.fromJSON({
            "uid": _user.uid,
            "name": userData["name"],
            "email": userData["email"],
            "last_active": userData["last_active"],
            "image": userData["image"],
          },
          );
          _navigationService.removeAndNavigateToRoute('/home');
        },);
      } else {
        _navigationService.removeAndNavigateToRoute('/login');
      }
    }
    );
  }

  Future<void> loginUsingEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      log('Error logging user into Firebase');
    } catch (e) {
      print(e);
    }
  }
}