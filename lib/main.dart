import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluevo_app/managers/sentenceManager.dart';
import 'screens/word_counter_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SentenceManager>(
          create: (_) => SentenceManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Soluevo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 103, 246, 98),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0)),
        initialRoute: '/home',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/frasecounter':
              return MaterialPageRoute(builder: (_) => wordCounterScreen());
            case '/home':
            default:
              return MaterialPageRoute(builder: (_) => HomePage());
          }
        },
      ),
    );
  }
}
