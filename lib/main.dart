import 'package:flutter/material.dart';
import 'package:islami_app/core/init_app.dart';
import 'package:islami_app/core/theme/app_theme.dart';
import 'package:islami_app/features/layout/home_screen.dart';
import 'package:islami_app/features/layout/tabs/quran_tab/sura_details.dart';
import 'package:islami_app/features/splash_screen/view/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/layout/tabs/hadeth_tab/hadeth_details.dart';
import 'features/layout/tabs/hadeth_tab/hadeth_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitApp.initApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routName,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        SplashScreen.routName: (context) => SplashScreen(),
        HomeScreen.routName: (context) => HomeScreen(),
        SuraDetails.routName: (context) => SuraDetails(),
        HadethDetails.routName: (context) => HadethDetails(),
      },
    );
  }
}
