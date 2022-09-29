import 'package:flutter/material.dart';

class vwAutenticacao extends StatefulWidget {
  const vwAutenticacao({Key? key}) : super(key: key);

  @override
  State<vwAutenticacao> createState() => _vwAutenticacaoState();
}

class _vwAutenticacaoState extends State<vwAutenticacao> {

  TextEditingController _controllerCPF = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logotipo.png"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "CPF"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerCPF,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Senha"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerSenha,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "Clique aqui!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
