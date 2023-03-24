import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/list_of_providers.dart';
import 'package:inter_coffee/constants/routes.dart';
import 'package:inter_coffee/main.dart';

import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: ResponsiveSizer(
          builder: (p0, p1, p2) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: isAdmin ? ThemeMode.light : ThemeMode.dark,
              darkTheme: ThemeData(
                secondaryHeaderColor: Colors.transparent,
                primaryColorLight: const Color.fromARGB(60, 0, 0, 0),
                dividerColor: const Color.fromARGB(255, 182, 182, 182),
                hintColor: const Color.fromARGB(160, 255, 255, 255),
                bottomAppBarTheme: const BottomAppBarTheme(
                  color: Colors.black38,
                  surfaceTintColor: Colors.black38,
                ),
                cardColor: const Color.fromARGB(70, 255, 255, 255),
                navigationBarTheme: const NavigationBarThemeData(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white12,
                ),
              ),
              theme: ThemeData(
                secondaryHeaderColor: const Color.fromRGBO(255, 255, 255, 1),
                primaryColorLight: const Color.fromRGBO(255, 255, 255, 0.6),
                dividerColor: const Color.fromRGBO(58, 23, 23, 1),
                hintColor: const Color.fromRGBO(58, 23, 23, 1),
                bottomAppBarTheme: const BottomAppBarTheme(
                    color: Color.fromRGBO(62, 36, 21, 0.5),
                    surfaceTintColor: Color.fromRGBO(62, 36, 21, 1)),
                cardColor: Colors.white,
                navigationBarTheme: const NavigationBarThemeData(
                  backgroundColor: Color.fromRGBO(58, 23, 23, 1),
                  surfaceTintColor: Colors.white,
                ),
              ),
              initialRoute: initialroute,
              routes: routes,
            );
          },
        ));
  }
}
