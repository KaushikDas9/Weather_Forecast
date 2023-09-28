import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Home_screen/Home.dart';
import 'Loading_screen/Loading.dart';
import 'Location_screen/Location.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Loading",
      routes: {
        "/Home": (context) => const Home1(),
        "/Loading": (context) => const Loading1(),
        "/Location": (context) => const Location(),
      },
    ),
  );
}
