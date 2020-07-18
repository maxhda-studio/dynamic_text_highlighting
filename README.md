# Dynamic Text Highlighting (DTH)

This package is used to highlight, in a completely dynamic way, 
a keyword, or a phrase, wherever it is present in a specified text.

<p align="center">
<img src="/assets/demo.gif" width="249" height="315"/>
</p>

## Getting Started

DynamicTextHighlighting is also the name of the package widget. 
It returns a RichText widget, or a Text widget if there is nothing 
highlighted. It accepts four parameters:

* `text`: this is the whole text.
* `highlightText`: this is only the highlighted text.
* `highlightColor`: nothing to say.
* `style`: this is the default text style.

### Example

```dart
Widget buildDTH(String text, String highlightText) {
  return DynamicTextHighlighting(
    text: text,
    highlightText: highlightText,
    highlightColor: Colors.yellow,
    style: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
```

It is a stateless widget, so for any changes
just call `setState(() {...})`.

```dart
void applyChanges(String newHighlightText) {
  setState(() {
    highlightText = newHighlightText;
  });
}
```