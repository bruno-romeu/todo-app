import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(ListTarefasApp());
}

class ListTarefasApp extends StatelessWidget {
  const ListTarefasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = [];
  TextEditingController controller = TextEditingController();

  void adicionarTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
      controller.clear();
    });
  }

  Widget getItem(Tarefa tarefa) {


    return Row(
      children: [
        IconButton (
          icon: Icon(tarefa.concluida ? 
          Icons.check_box : 
          Icons.check_box_outline_blank,
          color: Colors.green,
          size: 42
          ),
          iconSize: 42,
          onPressed: () {
            setState(() {
              tarefa.concluida = !tarefa.concluida;
            });
          },),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tarefa.nome), 
            Text(
              '${tarefa.data.day.toString()}/${tarefa.data.month.toString()}/${tarefa.data.year.toString()}'
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blueAccent,
      ),

      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Digite uma nova tarefa...'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              controller: controller,
              onSubmitted: adicionarTarefa
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (_, indice) {
                return getItem(tarefas[indice]);
              }
          )),
        ]
      ),
    );
  }
}
