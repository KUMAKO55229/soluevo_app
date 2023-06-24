import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../managers/sentenceManager.dart';

class wordCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            child: Row(
              children: [
                Flexible(
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          )),
      body: Consumer<SentenceManager>(
        builder: (_, sentenceManager, __) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 32),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [], // Remova todas as sombras
                // Defina outras propriedades de estilo conforme necessário
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Resultado:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ...sentenceManager.contagem.entries.map((entry) {
                    final palavra = entry.key;
                    final quantidade = entry.value;

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          '$palavra: $quantidade',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
