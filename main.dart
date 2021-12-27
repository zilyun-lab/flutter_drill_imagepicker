import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'complete_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickedPage(
                          image: image,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('フォルダから')),
            ElevatedButton(
                onPressed: () async {
                  final XFile? image = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (image != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickedPage(
                          image: image,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('カメラを起動')),
          ],
        ),
      ),
    );
  }
}
