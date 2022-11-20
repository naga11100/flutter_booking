import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  Hotel(DocumentSnapshot doc) {
    name = doc['name'];
    imageURL = doc['imageURL'];
  }
  late String name;
  late String imageURL;
}