import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//void main() {
 // runApp(MaterialApp(
  //  home: Home(),
  //));
//}

class ScanScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ScanScreen> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
        title:  Text(AppLocalizations.of(context)!.captureImage),
        centerTitle: true,
      ),




      body: SingleChildScrollView(
        child: Padding(


        padding: const EdgeInsets.all(12),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageFile != null)
                Container(
                  width: 640,
                  height: 480,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(image: FileImage(imageFile!)),
                    border: Border.all(width: 8, color: Colors.black12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              else
                Container(
                  width: 640,
                  height: 480,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(width: 8, color: Colors.black12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                      AppLocalizations.of(context)!.imagesbh,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(

                children: [

                  ElevatedButton(

                    onPressed: (

                        ) => getImage(source: ImageSource.camera),
                    style: TextButton.styleFrom(
                      backgroundColor:Colors.blue
                    ),
                    child:
                    Text(
                        AppLocalizations.of(context)!.captureImage),
                  ),


                  const SizedBox(
                    width:70
                  ),

                  ElevatedButton(
                    onPressed: () => getImage(source: ImageSource.gallery),
                    child:  Text(AppLocalizations.of(context)!.uploadImage),
                    style: TextButton.styleFrom(
                     backgroundColor:Colors.blue
    ),
                  ),
                ],
              ),

              const SizedBox(
                width: 100,
                height:10,
              ),




              ElevatedButton(

                onPressed: (){},
                child:  Text(AppLocalizations.of(context)!.showResult),
                style: TextButton.styleFrom(
                    backgroundColor:Colors.blue
                ),
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