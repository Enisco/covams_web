import 'dart:ui';

import 'package:covams_web/utilities/theme_data.dart';
import 'package:flutter/material.dart';
import 'main pages/covams_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'CoVaMS',
            theme: lightThemeData,
            darkTheme: darkThemeData,

            themeMode: currentMode,
            home: const CovamsHomePage(),
          );
        });
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
