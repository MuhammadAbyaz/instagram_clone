import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/posts.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String?> uploadPost(String description, Uint8List file, String uid, String username, String profImage) async {
    String res = "Some error occurred";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      _fireStore.collection('posts').doc(postId).set(post.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
  }
}
