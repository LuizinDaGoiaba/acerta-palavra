import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Map<String, List<String>> palavras = {
    "Estojo": [
      "Usado para guardar materiais escolares",
      "Geralmente onde guarda lápis e caneta"
    ],
    "Garrafa": [
      "Objeto onde se põe líquido",
      "Encontrado também na geladeira"
    ],
    "Relógio": [
      "Conta as horas",
      "Acessório usado no braço"
    ],
  };

  String palavraAtual = "Estojo";
  int dicaIndex = 0;
  String mensagem = "";

  final TextEditingController _controller = TextEditingController();

  void verificarPalavra() {
    if (_controller.text.trim().toLowerCase() ==
        palavraAtual.toLowerCase()) {
      setState(() {
        mensagem = "Parabéns! Você acertou!";
      });
    } else {
      setState(() {
        mensagem = "Tente novamente!";
      });
    }
  }

  void mostrarDica() {
    setState(() {
      dicaIndex = (dicaIndex + 1) % palavras[palavraAtual]!.length;
      mensagem = palavras[palavraAtual]![dicaIndex];
    });
  }

  void trocarPalavra() {
    setState(() {
      List<String> keys = palavras.keys.toList();
      palavraAtual = keys[Random().nextInt(keys.length)];
      dicaIndex = 0;
      mensagem = "Nova palavra escolhida!";
      _controller.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aplicativo de Acertar Palavras",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite a palavra",
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: verificarPalavra,
              child: Text("Confirmar"),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: mostrarDica,
              child: Text("Pedir Dica"),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: trocarPalavra,
              child: Text("Trocar Palavra"),
            ),

            SizedBox(height: 24),

            Text(
              mensagem,
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
