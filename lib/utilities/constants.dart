import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';
import 'dart:ui_web' as ui;

class AppConstants{

  ///app version
     static String appVersion = '1.7';

  /// resume path
  static String resume = 'assets/resume/resume.pdf';
  static String resumeWeb = ui.assetManager.getAssetUrl('assets/resume/resume.pdf');

  ///external links
  static String github = 'https://github.com/FaisalNazir28';
  static String bitbucket = 'https://github.com/FaisalNazir28';
  static String stackOverflow = 'https://github.com/FaisalNazir28';
  static String linkedin = 'https://github.com/FaisalNazir28';
  static String whatsapp = 'https://github.com/FaisalNazir28';
  static String facebook = 'https://github.com/FaisalNazir28';

  // List<HorizontalScrollBarTile> horizontalScrollBarTile = [
  //   HorizontalScrollBarTile(count: '15', text: 'Websites developed'),
  //   HorizontalScrollBarTile(
  //       count: '',
  //       text: '',
  //       icon: Icon(
  //         CupertinoIcons.textformat_abc_dottedunderline,
  //         size: 40,
  //       )),
  //   HorizontalScrollBarTile(count: '33', text: 'Projects finished'),
  //   HorizontalScrollBarTile(
  //       count: '',
  //       text: '',
  //       icon: Icon(
  //         CupertinoIcons.airplane,
  //         size: 40,
  //       )),
  //   HorizontalScrollBarTile(count: '9', text: 'Apps Built'),
  //   HorizontalScrollBarTile(
  //       count: '',
  //       text: '',
  //       icon: Icon(
  //         Icons.code_off_sharp,
  //         size: 40,
  //       )),
  //   HorizontalScrollBarTile(count: '17', text: 'Recognitions'),
  //   HorizontalScrollBarTile(
  //       count: '',
  //       text: '',
  //       icon: Icon(
  //         Icons.five_g_sharp,
  //         size: 40,
  //       )),
  // ];

}

