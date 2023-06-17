import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastrarTerreno extends StatefulWidget {
  @override
  _CadastrarTerrenoState createState() => _CadastrarTerrenoState();
}

class _CadastrarTerrenoState extends State<CadastrarTerreno> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _zip_codeController = TextEditingController();
  final TextEditingController _public_placeController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _city_idController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar terreno"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      "Endereço:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "CEP",
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _zip_codeController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Logradour",
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    controller: _public_placeController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Número",
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    controller: _numberController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Bairro",
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    controller: _districtController,
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
                            //border: InputBorder.none,
                            labelText: "Estado",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
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
                            //border: InputBorder.none,
                            labelText: "Cidade",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      "Localização:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    )),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            //border: InputBorder.none,
                            labelText: "Latitude",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          controller: _latController,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            //border: InputBorder.none,
                            labelText: "Longitude",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          controller: _longController,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Utilizar cordenadas atuais?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Switch(value: true, onChanged: (bool valor) {}),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      "Informações do terreno:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    )),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            //border: InputBorder.none,
                            labelText: "Largura",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          controller: _widthController,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            //border: InputBorder.none,
                            labelText: "Comprimento",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          controller: _lengthController,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            //border: InputBorder.none,
                            labelText: "Preço (R\$)",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          controller: _priceController,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            //border: InputBorder.none,
                            labelText: "Tipo",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Descrição",
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _descriptionController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/icone.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
