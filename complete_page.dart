import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class PickedPage extends StatelessWidget {
  const PickedPage({Key? key, required this.image}) : super(key: key);
  final XFile image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('完了'),
      ),
      body: Column(
        children: [
          Image.file(File(image.path)),
          const Text('この写真でいいですか？'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                  (route) => false);
            },
            child: const Text('完了'),
          )
        ],
      ),
    );
  }
}
