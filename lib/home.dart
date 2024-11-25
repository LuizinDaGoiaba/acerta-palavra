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
  final TextEditingController _controller = TextEditingController();

  void verificarPalavra() {
    bool acertou = _controller.text.trim().toLowerCase() ==
        palavraAtual.toLowerCase();

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: acertou ? "Parabéns! Você acertou!" : "Tente novamente!",
    );
  }

  void mostrarDica() {
    setState(() {
      dicaIndex = (dicaIndex + 1) % palavras[palavraAtual]!.length;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(palavras[palavraAtual]![dicaIndex])),
    );
  }

  void trocarPalavra() {
    setState(() {
      List<String> keys = palavras.keys.toList();
      palavraAtual = keys[Random().nextInt(keys.length)];
      dicaIndex = 0;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite a palavra",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: verificarPalavra,
              child: const Text("Confirmar"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: mostrarDica,
              child: const Text("Pedir Dica"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: trocarPalavra,
              child: const Text("Trocar Palavra"),
            ),
          ],
        ),
      ),
    );
  }
}