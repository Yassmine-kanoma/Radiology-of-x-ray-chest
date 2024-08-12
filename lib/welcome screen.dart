import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yassmineee/home_layout.dart';
import 'package:yassmineee/utils/app_constants.dart';

import 'loginScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class welcomescreen extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Colors.blue,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
        splash: const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/lungs.jpeg'),),
        nextScreen: AppConstants.userId.isEmpty?secondScreen():HomeLayout());
  }
}
class secondScreen extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(100.0),
        // child: Center(
        child: SingleChildScrollView(

          child: Column(


            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              ),





              const SizedBox(
                width: 200,
                height: 50,
              ),


              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/lungs.jpeg'),

              ),



              const SizedBox(
                width: 150,
                height: 50,
              ),





             Text(
                 AppLocalizations.of(context)!.welcomeORYGHEN,
               style: const TextStyle(
                   fontSize: 35.0,
                   color: Colors.blue,
                   fontWeight: FontWeight.bold
               )
               // GoogleFonts.dancingScript(
               //
               //   fontSize: 35.0,
               //   color: Colors.blue,
               //   fontWeight: FontWeight.bold
               // ),
              ),

             const SizedBox(
               width: 250,
              height: 100,
             ),

              Container(

                decoration: BoxDecoration(
                  color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                ),
                child:TextButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>looginScreen ()),
                    );

                  },
                child: Text(
                    AppLocalizations.of(context)!.next,
                  style: const TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )
                  // GoogleFonts.dancingScript(
                  //
                  //     fontSize: 35.0,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold
                  // ),

                  ),
                ),

              ),




            ],
          ),
        ),
      ),
      //  ),
    );
  }
}