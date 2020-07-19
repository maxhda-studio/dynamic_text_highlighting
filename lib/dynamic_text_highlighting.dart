library dynamic_text_highlighting;

import 'package:flutter/material.dart';

class DynamicTextHighlighting extends StatelessWidget {
  final String text;
  final String highlightText;
  final Color highlightColor;
  final TextStyle style;

  DynamicTextHighlighting({
    Key key,
    this.text = '',
    this.highlightText = '',
    this.highlightColor = Colors.yellow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //If the text or the highlight text are empty, then return normal text.
    if (text.isEmpty || highlightText.isEmpty) return Text(text, style: style);

    List<TextSpan> _spans = [];
    int _start = 0;
    int _indexOfHighlight;

    while (true) {
      _indexOfHighlight = text.indexOf(highlightText, _start);

      if (_indexOfHighlight < 0) {
        //Nothing to be highlighted.
        _spans.add(_normalSpan(text.substring(_start, text.length)));
        break;
      }

      if (_indexOfHighlight == _start) {
        //The text starts with highlighting.
        _spans.add(_highlightSpan(highlightText));
        _start += highlightText.length;
      } else {
        //Normal text and highlighted text.
        _spans.add(_normalSpan(text.substring(_start, _indexOfHighlight)));
        _spans.add(_highlightSpan(highlightText));
        _start = _indexOfHighlight + highlightText.length;
      }
    }

    //The returned value is a rich text widget with all the highlights.
    return Text.rich(TextSpan(children: _spans));
  }

  //Method used to create a new highlight text span.
  TextSpan _highlightSpan(String content) {
    return TextSpan(
        text: content, style: style.copyWith(backgroundColor: highlightColor));
  }

  //Method used to create a new normal text span.
  TextSpan _normalSpan(String content) {
    return TextSpan(text: content, style: style);
  }
}
