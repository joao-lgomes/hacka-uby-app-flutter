import 'package:flutter/material.dart';

class DrawerProvider {
  DrawerProvider();


  List<DrawerItem> drawerItems = [
    DrawerItem(
        title: "Registrar inovação",
        icon: Icons.create,
        size: 22),
    DrawerItem(
        title: "Lojinha",
        icon: Icons.shopping_bag_outlined,
        size: 24,
        externalNavigation: "https://www.figma.com/proto/cv0ZWgDw6hQZzeilvQfGF0/Untitled?type=design&node-id=1-2&t=IuTrdXtlCGz945l1-1&scaling=scale-down&page-id=0%3A1&mode=design"),
  ];
}

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget? navigateTo;
  final double? size;
  final String? externalNavigation;

  DrawerItem(
      {required this.title,
        required this.icon,
        this.navigateTo,
        this.size, this.externalNavigation});
}