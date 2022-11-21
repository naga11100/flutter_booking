import 'package:flutter/material.dart';

import 'home.dart';

class MyPage extends StatelessWidget {
  const MyPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 中央寄せを設定
        title: const Text(
          'マイページ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff009688),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sample"),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Home(),
                  ),
                );
              },
              child: const Text('ホームへ'),
            ),
          ],
        ),
      ),
    );
  }
}