import 'package:flutter/material.dart';
import 'package:shop/view/homepage.dart';
import 'package:get/get.dart';
import 'package:shop/view/show_coomodity.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage(),transition: Transition.downToUp),
        GetPage(name: "/comoodity", page: () => showCoomodity(),transition: Transition.downToUp),
      ],
    );
  }
}
