import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.subTitle = '',
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  String subTitle;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/image2/speaker.json',
      selectedImagePath: 'assets/image2/tab_1s.png',
      index: 0,
      isSelected: true,
      subTitle: 'satu',
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/image2/speaker.json',
      selectedImagePath: 'assets/image2/tab_2s.png',
      index: 1,
      isSelected: false,
      subTitle: 'dua',
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/image2/speaker.json',
      selectedImagePath: 'assets/image2/tab_3s.png',
      index: 2,
      isSelected: false,
      subTitle: 'tiga',
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/image2/speaker.json',
      selectedImagePath: 'assets/image2/tab_4s.png',
      index: 3,
      isSelected: false,
      subTitle: 'empat',
      animationController: null,
    ),
  ];
}
