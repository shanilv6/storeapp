import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:storeapp/presentations/screens/home_screen.dart';

import 'consts/color_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 3.0.4 ',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstant.lightScaffoldColor,
        primaryColor: ColorConstant.lightCardColor,
        backgroundColor: ColorConstant.lightBackgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: ColorConstant.lightIconsColor,
          ),
          backgroundColor: ColorConstant.lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: ColorConstant.lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.lightIconsColor,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,

          // selectionHandleColor: Colors.blue,
        ),

        // textTheme: TextTheme()
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.black,
        //       displayColor: Colors.black,
        //     ),
        cardColor: ColorConstant.lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: ColorConstant.lightIconsColor,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
