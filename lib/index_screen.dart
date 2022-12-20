// ignore_for_file: unused_field, use_key_in_widget_constructors, must_be_immutable

import 'dart:io';

import "package:flutter/material.dart";

import "./image_input.dart";

class IndexScreen extends StatelessWidget {
  // File _pickedImage;
  late File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POSE ESTIMATION'),
      ),
      body: ImageInput(_selectImage),
    );
  }
}
