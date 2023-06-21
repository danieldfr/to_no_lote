import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

//temporario
import 'package:http/http.dart' as http;
import 'package:to_no_lote/pages/Inicio.dart';
import 'package:to_no_lote/services/dados_api.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../services/lots_services.dart';

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
  List<XFile>? imagefiles;
  bool corruentCordinate = true;
  late Position position;
  double? long, lat;
  List<Map<String, dynamic>> type_options = [
    {"label": "Residencial", "value": 'R'},
    {"label": "Comercial", "value": 'C'}
  ];
  String type_select = 'R';
  List<String> selected = [];
  ////////

  final List<Map<String, dynamic>> typeOptions = [
    {'id': 1, 'name': 'Ágio'},
    {'id': 2, 'name': 'Troca'},
    {'id': 3, 'name': 'Ä vista'},
    {'id': 4, 'name': 'Negociável'},
  ];
  List<Map<String, dynamic>> selectedOptions = [];
  void initState() {
    super.initState();
    getLocation();
    carregarDadosDaAPI();
    // _stream = _streamController.stream;
  }

  List<dynamic> options = []; // Lista para armazenar as opções do select box
  String selectedOption = ''; // Opção selecionada no select box

  Future<void> carregarDadosDaAPI() async {
    var data = await get_cities();
    // Extraia as opções da resposta
    List<dynamic> apiOptions = data['data'];
    // Preencha a lista de opções do select box
    setState(() {
      options = apiOptions.map((option) => option).toList();
      selectedOption = options.first['id'].toString();
    });
  }

  Future<void> register() async {
    var success;
    success = true;
    if (_formKey.currentState!.validate()) {
      var success = await register_lots(
          _zip_codeController.text,
          _public_placeController.text,
          _numberController.text,
          _districtController.text,
          selectedOption,
          _lengthController.text,
          _priceController.text,
          'R',
          _latController.text,
          _longController.text,
          _widthController.text,
          selectedOptions,
          _descriptionController.text,
          imagefiles);
      if (success) {
        print('Post enviado com sucesso');
        _showDialog();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Falha ao cadastrar>>>>>>>>>>"),
          backgroundColor: Colors.red.shade300,
          duration: const Duration(seconds: 5),
        ));
      }
    }
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Text('Lote cadastrado com sucesso'),
          content: Text(
            'Sucesso',
            style: TextStyle(fontSize: 18),
          ),
          contentTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
          actions: [
            TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Inicio(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                        child: TextFormField(
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
                        child: DropdownButton<String>(
                          value: selectedOption,
                          onChanged: (newValue) {
                            setState(() {
                              selectedOption = newValue!.toString();
                            });
                          },
                          items: options.map((option) {
                            return DropdownMenuItem<String>(
                              value: option['id'].toString(),
                              child: Text(option['title']),
                            );
                          }).toList(),
                        ),
                        // TextFormField(
                        //   keyboardType: TextInputType.text,
                        //   decoration: InputDecoration(
                        //     //border: InputBorder.none,
                        //     labelText: "Cidade",
                        //   ),
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     color: Colors.black,
                        //   ),
                        // ),
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
                        child: Switch(
                            value: corruentCordinate,
                            onChanged: (bool valor) {
                              setState(() {
                                corruentCordinate = !corruentCordinate;
                                if (corruentCordinate) {
                                  getLocation();
                                }
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          readOnly: corruentCordinate,
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
                        child: TextFormField(
                          readOnly: corruentCordinate,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                        child: DropdownButton<String>(
                          value: type_select,
                          onChanged: (newValue) {
                            setState(() {
                              type_select = newValue!.toString();
                            });
                          },
                          items: type_options.map((option) {
                            return DropdownMenuItem<String>(
                              value: option['value'].toString(),
                              child: Text(option['label']),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                MultiSelectDialogField<Map<String, dynamic>>(
                  items: typeOptions
                      .map((option) => MultiSelectItem<Map<String, dynamic>>(
                            option,
                            option['name'],
                          ))
                      .toList(),
                  initialValue: selectedOptions,
                  title: Text('Selecione as opções'),
                  selectedColor: Colors.blue,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  buttonText: Text(
                    'Selecione',
                    style: TextStyle(color: Colors.black),
                  ),
                  onConfirm: (List<Map<String, dynamic>> values) {
                    setState(() {
                      selectedOptions = values;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
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
                  child: Column(
                    children: <Widget>[
                      imageView(),
                      IconButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        ),
                        onPressed: () {
                          _getFromCamera();
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async {
                            await openImages();
                          },
                          child: const Text(
                            'ou escolher fotos da galeria',
                            style: TextStyle(
                              fontSize: 20.0,
                              // color: primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      //color: Colors.orange,
                      child: Text(
                        "SALVAR",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: register,
                    )),
                // Padding(
                //   padding: EdgeInsets.all(8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Container(
                //         width: 120,
                //         child: Image.asset(
                //           'imagens/icone.png',
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //gps service
  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      long = position.longitude;
      lat = position.latitude;
      _latController.text = lat.toString();
      _longController.text = long.toString();
    });
  }

  openImages() async {
    try {
      ImagePicker? pickedFile = await ImagePicker();
      var pickedfiles = await pickedFile.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  _getFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print('arquivo');
      imagefiles?.add(image);
      setState(() {});
    }
  }

  Container imageView() {
    return imagefiles == null
        ? Container(
            // color: primaryColor,
            // width: 200,
            // height: 200,
            )
        : Container(
            child: CarouselSlider(
            options: CarouselOptions(),
            items: imagefiles!
                .map((item) => Container(
                      child: Center(
                          child: Image.file(File(item.path),
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
          ));
  }
}
