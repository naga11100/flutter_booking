import 'package:firebase_test/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/pages/mypage.dart';

enum TabItem {
  home(
    title: 'ホーム',
    icon: Icons.home,
    page: MyApp(),
  ),

  mypage(
    title: '設定',
    icon: Icons.settings,
    page: MyPage(),
  );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}