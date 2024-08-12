import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class dddd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.gridEx),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GridItem(icon: Icons.person, label: AppLocalizations.of(context)!.profile),
          GridItem(icon: Icons.home, label: AppLocalizations.of(context)!.home),
          GridItem(icon: Icons.settings, label: AppLocalizations.of(context)!.settings),
          GridItem(icon: Icons.notifications, label: AppLocalizations.of(context)!.notifications),
          GridItem(icon: Icons.camera, label: AppLocalizations.of(context)!.camera),
          GridItem(icon: Icons.search, label: AppLocalizations.of(context)!.search),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const GridItem({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle onTap event
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

