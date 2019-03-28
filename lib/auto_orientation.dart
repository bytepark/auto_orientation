import 'package:flutter/services.dart';

class AutoOrientation {
  static const MethodChannel _channel = const MethodChannel('auto_orientation');

  static landscapeMode() async {
    try {
      await _channel.invokeMethod('setLandscape');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  static portraitMode() async {
    try {
      await _channel.invokeMethod('setPortrait');
    } on MissingPluginException catch (_) {
      return;
    }
  }
}
