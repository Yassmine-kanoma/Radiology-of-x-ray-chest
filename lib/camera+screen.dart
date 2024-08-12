
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageFile != null)
                Container(
                  width: 600,
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(image: FileImage(imageFile!)),
                    border: Border.all(width: 8, color: Colors.black12),
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              else
                Container(
                  width: 600,
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 8, color: Colors.black12),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(AppLocalizations.of(context)!.imagesbh,
                      style: const TextStyle(
                          fontSize: 15.0,
                          // color: Colors.blue,
                          fontWeight: FontWeight.bold)
                    // GoogleFonts.dancingScript(
                    //
                    //     fontSize: 15.0,
                    //    // color: Colors.blue,
                    //     fontWeight: FontWeight.bold
                    // ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => getImage(source: ImageSource.camera),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(AppLocalizations.of(context)!.captureImage),
                  ),
                  const SizedBox(width: 70),
                  ElevatedButton(
                    onPressed: () => getImage(source: ImageSource.gallery),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(AppLocalizations.of(context)!.uploadImage),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(AppLocalizations.of(context)!.showResult),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}