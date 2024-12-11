

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "users";
const String CHAT_COLLECTION = "Chats";
const String MESSAGES_COLLECTION = "messages";

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService();

  Future<DocumentSnapshot> getUser(String uID) {
    return _db.collection(USER_COLLECTION).doc(uID).get();
  }

  Future<void> updateUserLastSeenTime(String uID) async {
    try {
      await _db.collection(USER_COLLECTION).doc(uID).update(
        {
          "last_active" :DateTime.now().toUtc(),
        },
      );
    } catch(e){
      print(e);
    }
  }
}