import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UploadDocumentsPage extends StatefulWidget {
  @override
  _UploadDocumentsPageState createState() => _UploadDocumentsPageState();
}

class _UploadDocumentsPageState extends State<UploadDocumentsPage> {
  File? _image1;
  File? _image2;
  File? _image3;
  final ImagePicker _picker = ImagePicker();

  Future _imgFromGallery(int containerIndex) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (containerIndex == 1) {
          _image1 = File(pickedFile.path);
          uploadFile(_image1);
        } else if (containerIndex == 2) {
          _image2 = File(pickedFile.path);
          uploadFile(_image2);
        } else if (containerIndex == 3) {
          _image3 = File(pickedFile.path);
          uploadFile(_image3);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadFile(File? image) async {
    if (image == null) return;
    final fileName = basename(image.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(image);
    } catch (e) {
      print('Error occurred during upload: $e');
    }
  }

  void _showPicker(BuildContext context, int containerIndex) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _imgFromGallery(containerIndex);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  // Implement camera capture logic here if needed
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Documents'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _showPicker(context,1);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: _image1 != null
                    ? Image.file(_image1!, fit: BoxFit.cover)
                    : Center(
                  child: Text('Add Image 1', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showPicker(context,2);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: _image2 != null
                    ? Image.file(_image2!, fit: BoxFit.cover)
                    : Center(
                  child: Text('Add Image 2', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showPicker(context,3);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
                child: _image3 != null
                    ? Image.file(_image3!, fit: BoxFit.cover)
                    : Center(
                  child: Text('Add Image 3', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
