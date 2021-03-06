import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/book_shared_preferences.dart';
import '../../util/constants.dart';

class FontSizeSetting extends StatefulWidget {
  final Function updateText;
  final bool isArabic;
  FontSizeSetting({this.isArabic, this.updateText});
  @override
  _FontSizeSettingState createState() => _FontSizeSettingState();
}

class _FontSizeSettingState extends State<FontSizeSetting>
    with BookSharedPreferences {
  @override
  Widget build(BuildContext context) {
    if (widget.isArabic) {
      return Column(
        children: <Widget>[
          Text(
            resourceArabicFontSizeText,
            style: TextStyle(fontSize: defaultArabicFontSize),
          ),
          Container(padding: EdgeInsets.all(textEdgeInset)),
          Text(
            '${(arabicFontSize / defaultArabicFontSize * 100 + 0.1).toInt()} %',
            style: TextStyle(fontSize: fonSizeFontSize),
          ),
          CupertinoSlider(
              value: arabicFontSize,
              min: defaultArabicFontSize * minFontSizePercentage,
              max: defaultArabicFontSize * maxFontSizePercentage,
              divisions: 6,
              onChanged: (double value) {
                setArabicFontSize(value);
                widget.updateText();
              })
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            resourceRussianFontSizeText,
            style: TextStyle(fontSize: defaultArabicFontSize),
          ),
          Container(padding: EdgeInsets.all(textEdgeInset)),
          Text(
            '${(russianFontSize / defaultRussianFontSize * 100 + 0.1).toInt()} %',
            style: TextStyle(fontSize: fonSizeFontSize),
          ),
          CupertinoSlider(
              value: russianFontSize,
              min: defaultRussianFontSize * minFontSizePercentage,
              max: defaultRussianFontSize * maxFontSizePercentage,
              divisions: 6,
              onChanged: (double value) {
                setRussianFontSize(value);
                widget.updateText();
              })
        ],
      );
    }
  }
}
