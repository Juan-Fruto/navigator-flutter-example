// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import "bienvenida.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Variables para identificar
  // Variables para identificar los campos de texto
  var txtLogin = TextEditingController();
  var txtPass = TextEditingController();

  // Método para construir el conjunto de Widgets de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login form',
      theme: ThemeData.light(),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login form'),
            ),
            body: Column(
              children: [
                // Imagen
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Image.asset(
                      "img/usuario.png",
                      width: 100,
                    ),
                  ),
                ),
                // Campo de texto para el login
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: "Login",
                    ),
                    // Nombramos el campo de texto
                    controller: txtLogin,
                  ),
                ),

                // Campo de texto para el password

                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    // pone asteriscos
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),

                    // Nombramos el campo de texto
                    controller: txtPass,
                  ),
                ),

                // El botón
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Validar Usuario"),
                    onPressed: () {
                      // Verificar el objeto navigateur
                      // Instrucciones que ejecutará el botón
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bienvenida(
                          txtLogin: txtLogin.text,
                          txtPassword: txtPass.text
                        )),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
