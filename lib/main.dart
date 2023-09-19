import 'package:flutter/material.dart';
import 'Home_screen/Home.dart';
import 'Loading_screen/Loading.dart';
import 'Location_screen/Location.dart';


void main() {
  runApp(  MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "/Loading",
    routes: {
          "/Home" :  (context) =>  const Home1(),
          "/Loading":  (context) =>  const Loading1(),
          "/Location" :  (context) => const Location(),
    },
  ),
  );
}




