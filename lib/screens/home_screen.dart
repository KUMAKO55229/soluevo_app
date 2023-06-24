import 'package:flutter/material.dart';
import 'package:soluevo_app/managers/sentence_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Form(
            key: formKey,
            child: Consumer<SentenceManager>(builder: (_, sentenceManager, __) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite a frase:',
                          style: TextStyle(fontSize: 20),
                        )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Digite alguma frase aqui',
                          border: OutlineInputBorder(
                            borderSide: BorderSide
                                .none, // Define uma borda transparente
                          ),
                        ),
                        autocorrect: false,
                        validator: (frase) {
                          if (frase!.isEmpty) {
                            return 'Campo obrigatorio';
                          } else if (frase.trim().split(' ').length <= 1) {
                            return 'Completa sua frase';
                          }
                          return null;
                        },
                        onSaved: (frase) => sentenceManager.wordCounter(frase!),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Text(
                              'OK',
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                minimumSize: MaterialStateProperty.all(
                                    Size(double.infinity, 50))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Navigator.of(context)
                                    .pushReplacementNamed('/frasecounter');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
