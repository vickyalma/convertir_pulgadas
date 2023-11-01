//Nombre: Edna Victoria Alvarez Machuca
//Proyecto: Aplicación de libre elección

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//Defino estilos y título.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Longitudes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversor de Longitudes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double centimetersToInches = 0.393701;            //Defino las variables
  final _centimeters = TextEditingController();
  final _inches = TextEditingController();

  //Funciones para realizar las conversiones.
  void convertToInches() {
    setState(() {
      double centimeters = double.parse(_centimeters.text);
      double inches = centimeters * centimetersToInches;
      _inches.text = inches.toStringAsFixed(2);
    });
  }

  void convertToCentimeters() {
    setState(() {
      double inches = double.parse(_inches.text);
      double centimeters = inches / centimetersToInches;
      _centimeters.text = centimeters.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[   //Campos de texto para cada unidad con su respectivo botón conversor.
            TextFormField(
              controller: _centimeters,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Centímetros",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: convertToInches,
              child: const Text('Convertir a Pulgadas'),
            ),
            TextFormField(
              controller: _inches,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Pulgadas",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: convertToCentimeters,
              child: const Text('Convertir a Centímetros'),
            ),
          ],
        ),
      ),
    );
  }
}

