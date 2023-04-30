import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    AutoOrientationDemo(),
  );
}

class AutoOrientationDemo extends StatefulWidget {
  AutoOrientationDemo({this.title = 'Auto Orientation Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _AutoOrientationDemoState();
  }
}

class _AutoOrientationDemoState extends State<AutoOrientationDemo> {
  TargetPlatform? _platform;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.landscapeLeftMode();
                    },
                    child: Padding(
                      child: Text("Landscape left mode"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown,
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                      ]);
                      AutoOrientation.landscapeRightMode();
                    },
                    child: Padding(
                      child: Text("Landscape right mode"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.portraitUpMode();
                    },
                    child: Padding(
                      child: Text("Portrait up mode"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.portraitDownMode();
                    },
                    child: Padding(
                      child: Text("Portrait down mode"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.fullAutoMode();
                    },
                    child: Padding(
                      child: Text("All modes (Android only)"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.setScreenOrientationUser();
                    },
                    child: Padding(
                      child: Text("Screen Orientation User mode (Android only)"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.landscapeAutoMode();
                    },
                    child: Padding(
                      child: Text("Landscape auto (Android only)"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      AutoOrientation.portraitAutoMode();
                    },
                    child: Padding(
                      child: Text("Portrait auto (Android only)"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
