import 'package:flutter/material.dart';

class vwMapa extends StatefulWidget {
  const vwMapa({Key? key}) : super(key: key);

  @override
  State<vwMapa> createState() => _vwMapaState();
}

class _vwMapaState extends State<vwMapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Mapa"),
        titleTextStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      body: Container(),
    );
  }
}
