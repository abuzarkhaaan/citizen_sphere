import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:citizen_sphere2/core/multi%20providers%20list/multi_providers_list.dart';
import 'package:citizen_sphere2/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// bool darkMode = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool savedMode = prefs.getBool('darkMode') ?? false;
  // darkMode = savedMode;
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(
        savedThemeMode: savedThemeMode,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  static showToastMessage(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return AdaptiveTheme(
            light: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorSchemeSeed: const Color(0xFF00966B),
            ),
            dark: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: const Color(0xFF00966B),
            ),
            initial: savedThemeMode ?? AdaptiveThemeMode.light,
            builder: (theme, darkTheme) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Citizen Sphere',
              theme: theme,
              darkTheme: darkTheme,
              // theme: ThemeData(
              //   colorScheme:
              //       ColorScheme.fromSeed(seedColor: const Color(0xFF00966B)),
              //   useMaterial3: true,
              // ),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
