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
        alignment: Alignment.center,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  "images/logotipo.png",
                  width: 150,
                  height: 127,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "CPF",
                    icon: Icon(
                      Icons.person,
                      color: Color(0xFF01813C)
                    )
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _controllerCPF,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Senha",
                    icon: Icon(
                      Icons.lock,
                      color: Color(0xFF01813C)
                    )
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _controllerSenha,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: (){},
                  child: Text(
                    "Recuperar senha.",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  //color: Colors.green,
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
                padding: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: (){},
                  child: Text(
                    "Cadastrar usuário.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
