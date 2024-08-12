import 'package:flutter/material.dart';
import 'package:yassmineee/about_screen.dart';
import 'package:yassmineee/cubits/profile_cubit/profile_cubit.dart';
import 'package:yassmineee/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'homeScreen.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    homeScreen(),
    const settingScreen(),
  ];

  @override
  void initState() {
    ProfileCubit.get(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ));
              },
              icon: const Icon(
                Icons.error_outline,
              )),
        ],
        //backgroundColor: Colors.black,
        title: Text(AppLocalizations.of(context)!.oraghenXRay,
            style: const TextStyle(
                fontSize: 25.0,
                // color: Colors.blue,
                fontWeight: FontWeight.bold)
            // GoogleFonts.dancingScript(
            //
            //     fontSize: 25.0,
            //    // color: Colors.blue,
            //     fontWeight: FontWeight.bold
            // ),
            ),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          }); // print (index);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              label: AppLocalizations.of(context)!.settings),
        ],
      ),
    );
  }
}
