import 'results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //screenutilで基準となる画面サイズを設定
    return ScreenUtilInit(
        designSize: const Size(393, 851),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) =>
            const MaterialApp(home: HomePage()));
  }
}

//Navigator機能させるためにclassを分ける
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,  // 中央寄せを設定
        title: const Text(
          "ホテル予約",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff009688),


      ),
      body: SizedBox(
        width: 393.w,
        child: Column(
          //中央寄せ
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //childrenでwidgetを複数配置
          children: <Widget>[
            //検索バー
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
                //キーボードの決定が押されたら画面遷移
                onSubmitted: (text) {
                  Navigator.push<void>(
                    context,
                    //Results.dartに入力した値を受け渡し
                    MaterialPageRoute<void>(
                        builder: (context) => Results(textValue: text)),
                  );
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
              height: 450.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
