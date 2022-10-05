import 'package:flutter/material.dart';

class vwCadastrarLote extends StatefulWidget {
  const vwCadastrarLote({Key? key}) : super(key: key);

  @override
  State<vwCadastrarLote> createState() => _vwCadastrarLoteState();
}

class _vwCadastrarLoteState extends State<vwCadastrarLote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preencha os dados do lote"),
        titleTextStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){},
                  child: Text(
                    "Clique aqui para indicar a localização do lote no mapa.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    "Endereço:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    labelText: "CEP",
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
                    labelText: "Logradouro",
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    labelText: "Bairro",
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Estado",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Cidade",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    "Informações do terreno:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Largura",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Comprimento",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          labelText: "Área (m^\2)",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Tipo do lote",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          labelText: "Valor (R\$)",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Forma de venda",
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    "Imagens do terreno:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Image.asset(
                        "images/picture_icon.png",
                        //width: 150,
                        //height: 127,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Image.asset(
                        "images/picture_icon.png",
                        //width: 150,
                        //height: 127,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Image.asset(
                        "images/picture_icon.png",
                        //width: 150,
                        //height: 127,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Image.asset(
                        "images/picture_icon.png",
                        //width: 150,
                        //height: 127,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Image.asset(
                        "images/picture_icon.png",
                        //width: 150,
                        //height: 127,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Image.asset(
                        "images/picture_icon.png",
                        //width: 150,
                        //height: 127,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: TextField(
                  maxLines: 5,
                  maxLength: 300,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: "Faça uma breve descrição sobre o terreno...",
                  ),
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: ElevatedButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
