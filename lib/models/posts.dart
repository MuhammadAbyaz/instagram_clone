import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "uid": uid,
      "username": username,
      "postId": postId,
      "datePublished": datePublished,
      "postUrl": postUrl,
      "profImage": profImage,
      "likes": likes,
    };
  }

  static Post fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    if (!snapshot.exists) throw Error();

    return Post.fromJson(snapshot.data()!);
  }

  static Post fromJson(Map<String, dynamic> userJson) {
    return Post(
        description: userJson["description"],
        uid: userJson['uid'],
        username: userJson['username'],
        postId: userJson['username'],
        datePublished: userJson['bio'],
        postUrl: userJson['followers'],
        profImage: userJson['followings'],
        likes: userJson['likes']);
  }
}
