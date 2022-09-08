import 'dart:async';

import 'package:flutter/services.dart';

class StoragePath {
  static const MethodChannel _channel = const MethodChannel('storage_path');

  /// To load images path on device
  static Future<String?> get imagesPath async {
    final String? data = await _channel.invokeMethod('getImagesPath');
    return data;
  }

  /// To load video path on device
  static Future<String?> get videoPath async {
    final String? data = await _channel.invokeMethod('getVideosPath');
    return data;
  }

  /// To load audio path on device
  static Future<String?> get audioPath async {
    final String? data = await _channel.invokeMethod('getAudioPath');
    return data;
  }

  /// To load file path on device
  static Future<String?> get filePath async {
    final String? data = await _channel.invokeMethod('getFilesPath');
    return data;
  }
}
