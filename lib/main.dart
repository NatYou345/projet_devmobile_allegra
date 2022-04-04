

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:window_size/window_size.dart';

import 'recherche.dart';
import 'liste_vacataires.dart';
import 'nouveau_vacataire.dart';

void main() {
  setupWindow();
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

const double windowWidth = 512;
const double windowHeight = 900;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Vacataires');
    setWindowMinSize(const Size(windowWidth, windowHeight));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.search),
                  text: 'Recherche',
                ),
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Nouveau',
                ),
                Tab(
                  icon: Icon(Icons.contact_phone),
                  text: 'Tous',
                ),
                
              ],
            ),
            title: const Text('Gestion des vacataires'),
          ),
          body: const TabBarView(
            children: [
              Recherche(),
              nouveau_vacataire(),
              ListeVacataires(),
              
            ],
          ),
        ),
      ),
    );
  }
}

