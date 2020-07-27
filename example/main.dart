import 'package:flutter/material.dart';
import 'package:dynamic_text_highlighting/dynamic_text_highlighting.dart';

void main() {
  runApp(DTHExampleApp());
}

class DTHExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: DTHExample(),
    );
  }
}

class DTHExample extends StatefulWidget {
  DTHExample({Key key}) : super(key: key);

  @override
  _DTHExampleState createState() => _DTHExampleState();
}

class _DTHExampleState extends State<DTHExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DynamicTextHighlighting(
          text: 'This is a demo text, the specified texts will be highlighted.',
          highlights: const ['demo', 'will'],
          color: Colors.yellow,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
