import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storage_path/storage_path.dart';
import 'package:storage_path_example/file_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FileModel> _files = new List<FileModel>();
  FileModel _selectedModel;

  @override
  void initState() {
    super.initState();
    getImagesPath();
  }

  getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    _files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (_files != null && _files.length > 0)
      setState(() {
        _selectedModel = _files[0];
      });
  }

  Future<void> getVideoPath() async {
    String videoPath = "";
    try {
      videoPath = await StoragePath.videoPath;
      var response = jsonDecode(videoPath);
      print(response);
    } on PlatformException {
      videoPath = 'Failed to get path';
    }
    return videoPath;
  }

  Future<void> getAudioPath() async {
    String audioPath = "";
    try {
      audioPath = await StoragePath.audioPath;
      var response = jsonDecode(audioPath);
      print(response);
    } on PlatformException {
      audioPath = 'Failed to get path';
    }
    return audioPath;
  }

  Future<void> getFilePath() async {
    String filePath = "";
    try {
      filePath = await StoragePath.filePath;
      var response = jsonDecode(filePath);
      print(response);
    } on PlatformException {
      filePath = 'Failed to get path';
    }
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _selectedModel == null ||
            (_selectedModel != null && _selectedModel.files.length < 1)
            ? Container()
            : GridView.builder(
          itemCount: _selectedModel.files.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (_, i) {
            var file = _selectedModel.files[i];
            return Container(
              child: Image.file(
                File(file),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}