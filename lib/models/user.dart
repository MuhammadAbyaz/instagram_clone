import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List followings;

  const UserModel({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.followings,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "uid": uid,
      "photoUrl": photoUrl,
      "username": username,
      "bio": bio,
      "followers": followers,
      "followings": followings,
    };
  }

  static UserModel fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    if (!snapshot.exists) throw Error();

    return UserModel.fromJson(snapshot.data()!);
  }

  static UserModel fromJson(Map<String, dynamic> userJson) {
    return UserModel(
      email: userJson["email"],
      uid: userJson['uid'],
      photoUrl: userJson['photoUrl'],
      username: userJson['username'],
      bio: userJson['bio'],
      followers: userJson['followers'],
      followings: userJson['followings'],
    );
  }
}
