

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GMainView extends StatefulWidget {
  const GMainView({Key? key}) : super(key: key);

  @override
  _GMainViewState createState() => _GMainViewState();
}

class _GMainViewState extends State<GMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.black),),
            )
          ],
        ),
      ),
    );
  }
}
