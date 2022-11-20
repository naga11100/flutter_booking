import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_test/pages/hotel_list.dart';

class Results extends StatelessWidget {
  final String textValue;

  const Results({Key? key, required this.textValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotelList>(
        // createでfetchBooks()も呼び出すようにしておく。
        create: (_) => HotelList()..searchHotel(textValue),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'ホテル検索結果',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            backgroundColor: const Color(0xff009688),
          ),
          body: Consumer<HotelList>(
            builder: (context, model, child) {
              // FirestoreのドキュメントのList booksを取り出す。
              final hotels = model.hotels;

              return SizedBox(
                  width: 393.w,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 315.w,
                          height: 50.h,
                          margin: EdgeInsets.symmetric(vertical: 30.h),
                          decoration: BoxDecoration(
                            //影をつける
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: TextEditingController(text: textValue),
                            //キーボードの決定が押されたら検索
                            onSubmitted: (text) {
                              model.searchHotel(text);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'ホテル名',
                            ),
                          ),
                        ),
                        Container(
                            width: 315.w,
                            height: 70.h,
                            margin: EdgeInsets.symmetric(vertical: 30.h),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              // Listの長さを先ほど取り出したbooksの長さにする。
                              itemCount: hotels.length,
                              // indexにはListのindexが入る。
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.network(hotels[index].imageURL),
                                  //　books[index]でList booksのindex番目の要素が取り出せる。
                                  title: Text(hotels[index].name),

                                );
                              },
                            ))
                      ]));
            },
          ),
        ),
    );
  }
}
