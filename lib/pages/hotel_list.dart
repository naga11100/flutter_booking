import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'hotel.dart';

class HotelList extends ChangeNotifier {
  List<Hotel> hotels = [];

  Future<void> searchHotel(String hotelName) async {
    // Firestoreからコレクション'books'(QuerySnapshot)を取得してdocsに代入。
      final docs = await FirebaseFirestore.instance.collection('hotel').where('name',isEqualTo: hotelName).get();
      // getter docs: docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
      // map(): Listの各要素をBookに変換
      // toList(): Map()から返ってきたIterable→Listに変換する。
      final hotels = docs.docs
          .map((doc) => Hotel(doc))
          .toList();
      this.hotels = hotels;
      notifyListeners();
  }
}