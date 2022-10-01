import 'package:flutter/material.dart';

class vwCadastrarUsuario extends StatefulWidget {
  const vwCadastrarUsuario({Key? key}) : super(key: key);

  @override
  State<vwCadastrarUsuario> createState() => _vwCadastrarUsuarioState();
}

class _vwCadastrarUsuarioState extends State<vwCadastrarUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preencha os dados abaixo"),
        titleTextStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: "Nome completo",
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: "CPF",
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: "E-mail",
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: "Telefone",
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: "Senha",
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: "Confirmar senha",
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                textColor: Colors.white,
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
