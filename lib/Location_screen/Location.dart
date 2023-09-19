import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
          body:const Column(
            children: [
                Text("Delhi"),
                Text("Kolkata"),
                Text("Mumbai"),
                Text("Gujrat"),
            ],
          ),
    );
  }
}
