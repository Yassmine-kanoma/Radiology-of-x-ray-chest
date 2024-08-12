import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yassmineee/cubits/posts_cubit/posts_cubit.dart';
import 'package:yassmineee/cubits/profile_cubit/profile_cubit.dart';
import 'package:yassmineee/firebase_options.dart';
import 'package:yassmineee/local/cache_helper.dart';
import 'package:yassmineee/themeProvider.dart';
import 'package:yassmineee/utils/app_constants.dart';
import 'package:yassmineee/welcome%20screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  AppConstants.userId = CacheHelper.getString(key: 'userId') ?? '';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // @override
  // _MyAppState createState() => _MyAppState();


  // static _MyAppState of(BuildContext context) =>
  //     context.findAncestorStateOfType<_MyAppState>()!;

// }

// class _MyAppState extends State<MyApp> {
//   ThemeMode _themeMode = ThemeMode.system;
  final  _notifierLocale = '';

  // Locale _currentLocale = const Locale(AppConfig.defaultLanguage, '');
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _futureFun = _initData();
  //
  //   // listen to change of interface language
  //   _notifierLocale.stream.listen((Locale? locale) async {
  //     if (locale != null && (locale.languageCode != _currentLocale.languageCode)) {
  //       final prefs = await SharedPreferences.getInstance();
  //       String newLocale = locale.languageCode;
  //       await prefs.setString('appLocale', newLocale);
  //       setState(() {
  //         _currentLocale = locale;
  //       });
  //     }
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _notifierLocale.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child:
        Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ProfileCubit(),),
              BlocProvider(create: (context) => PostsCubit(),),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: themeProvider.themeMode,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
             // locale: themeProvider.currentLocale,
              locale: themeProvider.currentLocale,
              home:  welcomescreen(),
            ),
          );
        }));
  }

  // void changeTheme(ThemeMode themeMode) {
  //   setState(() {
  //     _themeMode = themeMode;
  //   });
  //   print("RRRRRRRRRRRRRRRRRRRRRR $_themeMode");
  // }

}