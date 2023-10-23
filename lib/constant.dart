import 'package:flutter/material.dart';

const baseURL = 'http://192.168.43.109:8000/api';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/user';
const postsURL = '$baseURL/posts';
const commentsURL = '$baseURL/comments';

const serverError = 'Error del servidor, intente más tarde';
const unauthorized = 'Credenciales incorrectas';
const somethingWentWrong = 'Algo salió mal, intente más tarde';

//---input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(
        color: Colors.purple), // Cambia el color del texto a purpura
    contentPadding: const EdgeInsets.all(10),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
          width: 1,
          color: Colors.purple), // Cambia el color del borde a purpura
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.purple,
          width:
              1.0), // Cambia el color del borde cuando el campo no está enfocado
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.purple,
          width:
              1.0), // Cambia el color del borde cuando el campo está enfocado
    ),
  );
}

//---button style
TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: TextStyle(color: const Color.fromARGB(255, 214, 202, 216)),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 219, 207, 221)),
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.fromLTRB(50, 10, 50, 10)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.purple),
        ),
      ),
    ),
    onPressed: () => onPressed(),
  );
}

//---row

Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(label, style: TextStyle(color: Colors.purple),
        ), 
        onTap: () => onTap(),
      )
    ],
  );
}
