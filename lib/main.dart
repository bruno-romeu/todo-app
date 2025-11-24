import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(ListTarefasApp());
}

class ListTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaScreen());
  }
}

class ListaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blueAccent,
      ),

      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Digite uma nova tarefa'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  Column(
                    children: [Text('Lavar o Carro'), Text('24/11/2025 17:35')],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
