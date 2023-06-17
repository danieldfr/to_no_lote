import 'package:flutter/material.dart';
import 'package:to_no_lote/services/register_service.dart';
import 'package:intl/intl.dart';
import 'package:to_no_lote/pages/Autenticacao.dart';
import 'package:to_no_lote/models/User.dart';

class CadastrarUsuario extends StatefulWidget {
  @override
  _CadastrarUsuarioState createState() => _CadastrarUsuarioState();
}

class _CadastrarUsuarioState extends State<CadastrarUsuario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nifController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _birthdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> register() async {
    var success;

    if (_formKey.currentState!.validate()) {
      User user = User(
          '',
          null,
          _nameController.text,
          _nifController.text,
          _phoneController.text,
          _emailController.text,
          _birthdateController.text,
          _passwordController.text);

      success = await createUser(user);
      if (success == true) {
        _showDialog();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(success),
          backgroundColor: Colors.red.shade300,
          duration: const Duration(seconds: 5),
        ));
      }
    }
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Text('Usuário criado com sucesso!'),
          contentTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Autenticacao(),
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
        title: Text("Cadastrar usuário"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Nome completo",
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _nameController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "CPF",
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _nifController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "E-mail",
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _emailController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Telefone",
                    ),
                    style: TextStyle(fontSize: 18),
                    controller: _phoneController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _birthdateController,
                    onTap: () => _selectDate(context),
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Data de nascimento',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Senha",
                    ),
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
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      labelText: "Confirmar senha",
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    obscureText: true,
                    controller: _confirmPasswordController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    //color: Colors.orange,
                    child: Text(
                      "CADASTRAR",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: register,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
