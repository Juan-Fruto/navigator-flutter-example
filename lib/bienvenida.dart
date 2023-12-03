import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({Key? key, required String txtLogin, required String txtPassword}) : super(key: key);
  
  get txtLogin => null;
  
  get txtPassword => null;

  @override
  Widget build(BuildContext context) {
    // Mostrar el AlertDialog al inicio de la construcción del widget
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _mostrarAlertDialog(context);
    });

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }

  // Método para mostrar el AlertDialog
  void _mostrarAlertDialog(BuildContext context) {
    bool isValid = validations();
    List<String> errors = getErrors();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: isValid ? const Text('¡Bienvenido!') : const Text('Error de validación'),
          content: isValid
              ? const Text('Bienvenido a la aplicaciòn.')
              : Text(errors.join("\n")),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: isValid ? const Text('Aceptar') : const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
  
  bool validations(){
    return getErrors().isEmpty;
  }

  List<String> getErrors(){
    List<String> erros = [];

    // if(txtLogin.length == 0 || txtLogin.isUndefinedOrNull()){
    //   erros.add("The user has not been provided");
    // }
    // if(txtPassword.length == 0 || txtPassword.isUndefinedOrNull()){
    //   erros.add("The user has not been provided");
    // }
    if(txtLogin != "admin"){
      erros.add("Invalid user");
    }
    if(txtPassword != "admin"){
      erros.add("Invalid password");
    }

    // return erros.length > 0 ? false : true;
    return erros;
  }
}

