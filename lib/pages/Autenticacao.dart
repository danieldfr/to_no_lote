import 'package:flutter/material.dart';
import 'package:to_no_lote/pages/CadastrarUsuario.dart';
import 'package:to_no_lote/pages/Inicio.dart';

import '../models/Auth.dart';

class Autenticacao extends StatefulWidget {
  @override
  _AutenticacaoState createState() => _AutenticacaoState();
}

class _AutenticacaoState extends State<Autenticacao> {
  void _abrirCadastrarUsuario() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CadastrarUsuario()));
  }

  final AuthModel _auth = new AuthModel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    var success;

    success =
        await _auth.login(_emailController.text, _passwordController.text);

    if (success == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Inicio()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sucesso no longin>>>>>>>>>>"),
        backgroundColor: Colors.red.shade300,
        duration: const Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "imagens/icone.png",
                    width: 116,
                    height: 116,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Email",
                      icon: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _emailController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        //border: InputBorder.none,
                        labelText: "Senha",
                        icon: Icon(
                          Icons.lock,
                          color: Colors.orange,
                        )),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Recuperar senha",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    //color: Colors.orange,
                    child: Text(
                      "ENTRAR",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: login,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: _abrirCadastrarUsuario,
                    child: Text(
                      "Cadastrar usuário",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                        //decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
