library dynamic_text_highlighting;

import 'package:flutter/material.dart';

class DynamicTextHighlighting extends StatelessWidget {
  final String text;
  final String highlightText;
  final Color highlightColor;
  final TextStyle textStyle;

  DynamicTextHighlighting({
    Key key,
    this.text = '',
    this.highlightText = '',
    this.highlightColor = Colors.yellow,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty || highlightText.isEmpty)
      return Text(text, style: textStyle);

    List<TextSpan> _spans = [];
    int _start = 0;
    int _indexOfHighlight;

    while (true) {
      _indexOfHighlight = text.indexOf(highlightText, _start);

      if (_indexOfHighlight < 0) {
        _spans.add(_normalSpan(text.substring(_start, text.length)));
        break;
      }

      if (_indexOfHighlight == _start) {
        _spans.add(_highlightSpan(highlightText));
        _start += highlightText.length;
      } else {
        _spans.add(_normalSpan(text.substring(_start, _indexOfHighlight)));
        _spans.add(_highlightSpan(highlightText));
        _start = _indexOfHighlight + highlightText.length;
      }
    }

    return Text.rich(TextSpan(children: _spans));
  }

  TextSpan _highlightSpan(String content) {
    return TextSpan(text: content, style: textStyle.copyWith(backgroundColor: highlightColor));
  }

  TextSpan _normalSpan(String content) {
    return TextSpan(text: content, style: textStyle);
  }
}
