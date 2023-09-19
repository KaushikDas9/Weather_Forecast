
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather ForeCast"),
      ),
      body:const Column( mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
                      Text("Welcome to Our App")
        ],
      ),
    );
  }
}

class Loading1 extends StatefulWidget {
  const Loading1({super.key});

  @override
  State<Loading1> createState() => _Loading1State();
}

class _Loading1State extends State<Loading1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Weather ForeCast"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
          Text("Welcome to Our App" , )
  ]
          ),
          IconButton(
            icon:  const Icon(Icons.send),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/Home");
            },
          ),
        ],
      ),
    );
  }
}


