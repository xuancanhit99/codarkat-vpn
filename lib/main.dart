import 'package:codarkatvpn/app_preferences.dart';
import 'package:codarkatvpn/utils/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home_page.dart';


late Size sizeScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initHive();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,

        debugShowCheckedModeBanner: false,
        title: 'Codarkat VPN',
        theme: CAppTheme.lightTheme,
        darkTheme: CAppTheme.darkTheme,
        themeMode: AppPreferences.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: HomePage());
  }
}

// extension AppTheme on ThemeData {
//   Color get lightTextColor => AppPreferences.isDarkMode ? Colors.white70 : Colors.black54;
//   Color get bottomNavigationColor => AppPreferences.isDarkMode ? Colors.white12 : Colors.redAccent;
// }
