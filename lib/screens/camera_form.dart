import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/screens/editor.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Camera',
//     home: MyCamera(),
//   ));
// }

class MyCamera extends StatefulWidget {
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  String dirPath = '';
  File? imageFile;

  _initialImageView() {
    if (imageFile == null) {
      return Text('Select Image');
    } else {
      return Card(child: Image.file(imageFile!, width: 400.0, height: 400));
    }
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      // imageFile = picture as File?;
      imageFile = File(picture!.path);
      dirPath = picture.path;
      print('path');
      print(dirPath);
    });
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture as File;
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Take Image From...'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _initialImageView(),
            Column(
              children: [
                RaisedButton(
                  onPressed: () {
                    _showChoiceDialog(context);
                  },
                  child: Text('Select Image'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyImagePainter(
                                filePath: dirPath,
                              )),
                    );
                  },
                  child: Text('Image Editor'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
