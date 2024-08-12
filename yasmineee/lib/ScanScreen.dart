import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ScanScreen extends StatefulWidget {
  static const String routnamed = 'corn_ill';

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  List? _output;
  bool _loading = true;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/deep/model_unquant.tflite',
      labels: 'assets/deep/labels.txt',
    );
    setState(() {
      _loading = false;
    });
  }

  Future<void> detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 4,
    );
    setState(() {
      _output = output;
    });
  }

  Future<void> pickImageFromCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        _loading = true;
      });
      await detectImage(_image!);
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        _loading = true;
      });
      await detectImage(_image!);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? img = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _image != null
                  ? Column(
                children: [
                  Image.file(
                    _image!,
                    height: 250,
                  ),
                  SizedBox(height: 16),
                  _output != null
                      ? Text(
                    '${_output![0]['label']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : Container(),
                ],
              )
                  : img != null
                  ? Image.asset(
                img,
                height: 250,
                fit: BoxFit.cover,
              )
                  : Container(
                height: 250,
                color: Colors.grey[200],
                child: Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: pickImageFromCamera,
                icon: Icon(Icons.camera_alt),
                label: Text('Take Photo'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: pickImageFromGallery,
                icon: Icon(Icons.photo_library),
                label: Text('Upload Photo'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}