import 'package:firebase_test/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/pages/mypage.dart';

enum TabItem {
  home(
    title: 'ホーム',
    icon: Icons.home_outlined,
    page: Home(),
  ),

  mypage(
    title: '設定',
    icon: Icons.perm_identity,
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