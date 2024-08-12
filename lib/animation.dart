
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//void main() => runApp(MyApp());

//class MyAnimatedContainer extends StatelessWidget {
  @override
 // Widget build(BuildContext context) {
   // return MaterialApp(
     // home: MyAnimatedContainer(),
    //);
//  }
//}

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 100.0;
  double _height = 100.0;

  void _toggleSize() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _height = _height == 100.0 ? 200.0 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(AppLocalizations.of(context)!.welcomeORYGHEN,),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleSize,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _width,
            height: _height,
            color: Colors.teal,
            child: Center(
              child: Text(
                'Tap to Toggle',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


