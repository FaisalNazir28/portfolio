import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/horizontal_scrollbar_tile.dart';

class AppConstants{

  List<HorizontalScrollBarTile> horizontalScrollBarTile = [
    HorizontalScrollBarTile(count: '15', text: 'Websites developed'),
    HorizontalScrollBarTile(
        count: '',
        text: '',
        icon: Icon(
          CupertinoIcons.textformat_abc_dottedunderline,
          size: 40,
        )),
    HorizontalScrollBarTile(count: '33', text: 'Projects finished'),
    HorizontalScrollBarTile(
        count: '',
        text: '',
        icon: Icon(
          CupertinoIcons.airplane,
          size: 40,
        )),
    HorizontalScrollBarTile(count: '9', text: 'Apps Built'),
    HorizontalScrollBarTile(
        count: '',
        text: '',
        icon: Icon(
          Icons.code_off_sharp,
          size: 40,
        )),
    HorizontalScrollBarTile(count: '17', text: 'Recognitions'),
    HorizontalScrollBarTile(
        count: '',
        text: '',
        icon: Icon(
          Icons.five_g_sharp,
          size: 40,
        )),
  ];

}

