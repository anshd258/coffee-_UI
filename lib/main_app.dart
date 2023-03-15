import 'package:flutter/material.dart';
import 'package:inter_coffee/constants/routes.dart';
import 'package:inter_coffee/constants/listOfProviders.dart';
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
              initialRoute: initialroute,
              routes: routes,
            );
          },
        ));
  }
}
