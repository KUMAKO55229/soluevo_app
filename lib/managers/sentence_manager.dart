import 'package:flutter/material.dart';

class SentenceManager extends ChangeNotifier {
  Map<String, int> contagem = {};
  void wordCounter(String texto) {
    String textoLimpo =
        texto.trim().replaceAll(RegExp(r'[^\w\s]'), '').toLowerCase();

    List<String> palavras = textoLimpo.split(' ');
    Map<String, int> _contagem = {};
    for (String palavra in palavras) {
      _contagem[palavra] = (_contagem[palavra] ?? 0) + 1;
    }
    contagem = _contagem;
    notifyListeners();
  }
}
