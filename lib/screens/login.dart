import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:redapp/constant.dart';
import 'package:redapp/model/api_response.dart';
import 'package:redapp/model/user.dart';
import 'package:redapp/screens/register.dart';
import 'package:redapp/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:redapp/screens/home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController TxtEmail = TextEditingController();
  TextEditingController TxtPassword = TextEditingController();

  void _loginUser() async {
    ApiResponse response = await login(TxtEmail.text, TxtPassword.text);
    if (response.error == null ){
      _saveAndRedirectToHome(response.data as User);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}'),
      ));
    }
  }
  
  void _saveAndRedirectToHome(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', user.token ?? '');
    await prefs.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=>const Home()),(route)=>false);

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Ingresa a tu cuenta'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(35),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: TxtEmail,
              validator: (val) =>
                  val!.isEmpty ? 'correo electrónico requerido' : null,
              decoration: kInputDecoration("Correo electrónico"),
              style: const TextStyle(
                  color: Colors
                      .purple), // Cambia el color del texto ingresado a purpura
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: TxtPassword,
              obscureText: true,
              validator: (val) =>
                  val!.isEmpty ? 'Requiere al menos 6 caracteres' : null,
              decoration: kInputDecoration("Contraseña"),
              style: const TextStyle(
                  color: Colors
                      .purple), // Cambia el color del texto ingresado a purpura
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text(
                'Ingresar',
                style:
                    TextStyle(color: const Color.fromARGB(255, 214, 202, 216)),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.purple),
                padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(vertical: 10)),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _loginUser();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint ('¿No tienes una cuenta? ', 'Regístrate', (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=> Register()),(route)=>false);
            }),
          ],
        ),
      ),
    );
  }
}
