import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Iniciar sesión'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(35),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                labelStyle: TextStyle(
                    color:
                        Colors.purple), // Cambia el color del texto a amarillo
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors
                          .purple), // Cambia el color del borde a amarillo
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.purple,
                      width:
                          1.0), // Cambia el color del borde cuando el campo no está enfocado
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.purple,
                      width:
                          1.0), // Cambia el color del borde cuando el campo está enfocado
                ),
              ),
              style: const TextStyle(
                  color: Colors
                      .purple), // Cambia el color del texto ingresado a amarillo
            ),
          ],
        ),
      ),
    );
  }
}
