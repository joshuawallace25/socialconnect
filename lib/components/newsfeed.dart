import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/likebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Newsfeed extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  const Newsfeed({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  //user
  final _finaluser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(_finaluser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //Firebase Document Access
    DocumentReference postRef =
        FirebaseFirestore.instance
        .collection('User Post').doc(widget.postId);

    if (isLiked) {
      postRef.update({
        'Likes' : FieldValue.arrayUnion([_finaluser.email])
        });
    } else{
       postRef.update({
       'Likes' : FieldValue.arrayRemove([_finaluser.email])
        });
       
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              //Like button
              LikeButton(isLiked: isLiked,
               onTap: toggleLike),

const SizedBox(height: 5,),
//like count
Text(widget.likes.length.toString(),
style: TextStyle(color: Colors.grey),
)
            ],
          ),
          /* Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey[400] ),
          padding: EdgeInsets.all(10),
          child:Icon(Icons.person,
          color: Colors.white),
          
          ), */
          const SizedBox(width: 20),
          Column(
            children: [
              Text(widget.user, style: TextStyle(color: Colors.grey[500])),
              const SizedBox(
                height: 10,
              ),
              Text(widget.message),
            ],
          )
        ],
      ),
    );
  }
}
