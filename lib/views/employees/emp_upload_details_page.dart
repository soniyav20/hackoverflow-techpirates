import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:project_inc/services/service_imp.dart';

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

    setState(() async {
      if (pickedFile != null) {
        if (containerIndex == 1) {
          _image1 = File(pickedFile.path);
          await uploadFile(_image1, 1);
        } else if (containerIndex == 2) {
          _image2 = File(pickedFile.path);
          await uploadFile(_image2, 2);
        } else if (containerIndex == 3) {
          _image3 = File(pickedFile.path);
          await uploadFile(_image3, 3);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadFile(File? image, int i) async {
    ServiceImp imp = new ServiceImp();
    if (image == null) return;
    final fileName = basename(image.path);
    final destination = 'files/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(image);
      if (i == 1) {
        String downloadURL = await FirebaseStorage.instance
            .ref(destination)
            .child('file/')
            .getDownloadURL();
        imp.addPdocs(downloadURL);
      } else if (i == 2) {
        String downloadURL = await FirebaseStorage.instance
            .ref(destination)
            .child('file/')
            .getDownloadURL();
        imp.addTax(downloadURL);
      } else if (i == 3) {
        String downloadURL = await FirebaseStorage.instance
            .ref(destination)
            .child('file/')
            .getDownloadURL();
        imp.addcertificates(downloadURL);
      }
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
        backgroundColor: Color.fromRGBO(53, 85, 235, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Identity Proof"),
            GestureDetector(
              onTap: () {
                _showPicker(context, 1);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: _image1 != null
                    ? Image.file(_image1!, fit: BoxFit.cover)
                    : Center(
                        child: Text('Add Identity Doc',
                            style: TextStyle(color: Colors.white)),
                      ),
              ),
            ),
            SizedBox(height: 20),
            Text("Tax Proof"),
            GestureDetector(
              onTap: () {
                _showPicker(context, 2);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: _image2 != null
                    ? Image.file(_image2!, fit: BoxFit.cover)
                    : Center(
                        child: Text('Add Tax Certificate',
                            style: TextStyle(color: Colors.white)),
                      ),
              ),
            ),
            SizedBox(height: 20),
            Text("Certificate"),
            GestureDetector(
              onTap: () {
                _showPicker(context, 3);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
                child: _image3 != null
                    ? Image.file(_image3!, fit: BoxFit.cover)
                    : Center(
                        child: Text('Add Certificate',
                            style: TextStyle(color: Colors.white)),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
