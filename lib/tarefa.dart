class Tarefa {
  late String nome;
  late DateTime data;
  late bool concluida;

  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }
}
