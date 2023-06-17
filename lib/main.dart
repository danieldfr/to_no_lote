import 'package:flutter/material.dart';
import 'package:to_no_lote/pages/Autenticacao.dart';
import 'package:to_no_lote/pages/Inicio.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthModel _auth = AuthModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
        model: _auth,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<bool>(
            future: _auth.loadSettings(),
            builder: (buildContext, snapshot) {
              if (snapshot.data == true) {
                return Inicio();
              } else {
                return Autenticacao();
              }
            },
          ),
        ));
    // return const MaterialApp(
    //     debugShowCheckedModeBanner: false, home: HomePage());
  }
}
