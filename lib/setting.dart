import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yassmineee/functions/show_snack_bar.dart';
import 'package:yassmineee/homeScreen.dart';
import 'package:yassmineee/local/cache_helper.dart';
import 'package:yassmineee/profile_screen.dart';
import 'loginScreen.dart';
import 'main.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _MyAppState();
}

class _MyAppState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // backgroundColor: Colors.blueAccent,
      // leading: IconButton(icon: Icon(Icons.home),onPressed: (){},),
      // title: Text("Settings"),
      // centerTitle: true,
      // actions: [
      //  IconButton(icon:Icon(Icons.menu),onPressed: (){},),
      // SizedBox(width: 20,)
      // ],
      // ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 15,
                                  spreadRadius: 2.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
                                },
                                child: Container(
                                  height: 60,
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    // color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .profile,
                                              style: const TextStyle(
                                                  fontSize: 30.0,
                                                  //color: Colors.blue,
                                                  fontWeight: FontWeight.bold)
                                            // GoogleFonts.dancingScript(
                                            //     fontSize: 30.0,
                                            //     //color: Colors.blue,
                                            //     fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Icon(
                                            Icons.person,
                                            color: Colors.indigoAccent,
                                            size: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  Uri _url = Uri.parse(
                                      'https://play.google.com/store/apps/details?id=com.tencent.ig&hl=en&gl=US');
                                  if (!await launchUrl(_url)) {
                                    throw Exception('Could not launch $_url');
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    // color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                      Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .rating,
                                              style: const TextStyle(
                                                  fontSize: 30.0,
                                                  //color: Colors.blue,
                                                  fontWeight: FontWeight.bold)
                                            // GoogleFonts.dancingScript(
                                            //     fontSize: 30.0,
                                            //     //color: Colors.blue,
                                            //     fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Icon(
                                            Icons.star_half,
                                            color: Colors.yellow,
                                            size: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: ()async{
                                  Uri _url = Uri.parse(
                                      'https://play.google.com/store/apps/details?id=com.tencent.ig&hl=en&gl=US');
                                  if (!await launchUrl(_url)) {
                                  throw Exception(
                                  'Could not launch $_url');
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    // color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .update,
                                              style: const TextStyle(
                                                  fontSize: 30.0,
                                                  // color: Colors.blue,
                                                  fontWeight: FontWeight.bold)
                                            // GoogleFonts.dancingScript(
                                            //     fontSize: 30.0,
                                            //     // color: Colors.blue,
                                            //     fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Icon(
                                            Icons.upload_sharp,
                                            color: Colors.indigoAccent,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  CacheHelper.removeData(key: 'userId').then((value) {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) =>
                                            looginScreen(),), (route) => false);
                                    showSuccessSnackBar(context: context, message: 'logged out successfully ');
                                  });

                                },
                                child: Container(
                                  height: 60,
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    // color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                      Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .logOut,
                                              style: const TextStyle(
                                                  fontSize: 30.0,
                                                  //color: Colors.blue,
                                                  fontWeight: FontWeight.bold)
                                            // GoogleFonts.dancingScript(
                                            //     fontSize: 30.0,
                                            //     //color: Colors.blue,
                                            //     fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Icon(
                                            Icons.logout,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
