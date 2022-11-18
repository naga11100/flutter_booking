import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'hotel_list.dart';

class Results extends StatelessWidget {
  final String textValue;
  const Results({Key? key, required this.textValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<HotelList>(
        // createでfetchBooks()も呼び出すようにしておく。
        create: (_) => HotelList()..searchHotel(textValue),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ホテル検索結果',style: TextStyle(color: Colors.grey),),
            backgroundColor: Colors.white,
          ),
          body: Consumer<HotelList>(
            child: Container(
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
                //キーボードの決定が押されたら検索
                onSubmitted: (text)  {
                  HotelList().searchHotel(text);
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
            builder: (context, model, child) {
              // FirestoreのドキュメントのList booksを取り出す。
              final hotels = model.hotels;
              return ListView.builder(
                // Listの長さを先ほど取り出したbooksの長さにする。
                itemCount: hotels.length,
                // indexにはListのindexが入る。
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      //　books[index]でList booksのindex番目の要素が取り出せる。
                      title: Text(hotels[index].name),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
