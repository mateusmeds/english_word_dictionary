import 'dart:async';
import 'dart:convert';

import 'package:english_word_dictionary/app/core/enviroment/enviroment_config.dart';
import 'package:english_word_dictionary/app/core/export.dart'
    show DatabaseConfig, LoadDependency;
import 'package:english_word_dictionary/app/core/global_variable/global_variable.dart';
import 'package:english_word_dictionary/app/presentation/words/pages/words_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnviromentConfig.init();
  await DatabaseConfig.init();
  LoadDependency.load();
  var wordsJsonResponse = await rootBundle
      .loadString('assets/words_dictionary/words_dictionary.json');
  final Map<String, dynamic> wordsJsondata = json.decode(wordsJsonResponse);
  GlobalVariable.words = wordsJsondata.keys.toList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WordsPage(),
    );
  }
}
