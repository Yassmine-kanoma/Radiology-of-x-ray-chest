import 'package:flutter/material.dart';
import 'package:yassmineee/ScanScreen.dart';
import 'package:yassmineee/articals_screen.dart';
import 'package:yassmineee/chat%20screen.dart';
import 'package:yassmineee/maps_screen.dart';
import 'package:yassmineee/post_screen.dart';
import 'package:yassmineee/profile_screen.dart';



class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return GridItem(
            index: index,
            //  icon: _getIconForIndex(index),
            image: _getImageForIndex(index),
            label: _getLabelForIndex(index),
            onTap: () {
              _navigateToPage(context, index);
            },
          );
        }),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    String routeName;
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  postssPage(),));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  artical(),));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ScanScreen(),));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen(),));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MapsScreen(),));
        break;
      default:
        routeName = '/';
        break;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Profile';
      case 1:
        return 'Posts';
      case 2:
        return 'Articals';
      case 3:
        return 'Scan';
      case 4:
        return 'Chat';
      case 5:
        return 'Maps';
      default:
        return 'Unknown';
    }
  }

  String _getImageForIndex(int index) {
    switch (index) {
      case 0:
        return ('assets/images/womann.jpeg');
      case 1:
        return ('assets/images/post.jpeg');
      case 2:
        return ('assets/images/artical.jpeg');
      case 3:
        return ('assets/images/scan.jpeg');
      case 4:
        return ('assets/images/chatbox.jpeg');
      case 5:
        return ('assets/images/maps.png');
      default:
        return '';
    }
  }
}

class GridItem extends StatelessWidget {
  // final IconData icon;
  final String image;
  final String label;
  final VoidCallback onTap;

  const GridItem({
    Key? key,
    // required this.icon,
    required this.image,
    required this.label,
    required this.onTap,
    required int index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(label,
                style: const TextStyle(
                    fontSize: 20.0,
                    //color: Colors.blue,
                    fontWeight: FontWeight.bold)
                // GoogleFonts.dancingScript(
                //
                //     fontSize: 20.0,
                //     //color: Colors.blue,
                //     fontWeight: FontWeight.bold
                // ),

                ),
          ],
        ),
      ),
    );
  }
}




