import 'package:flutter/material.dart';
import 'package:prmda/pages/o_nas.dart';
import 'package:prmda/pages/sosiski_menu.dart';
import 'pages/regstr_page.dart';
import 'pages/home_page.dart';
import 'package:prmda/pages/krevitki_menu.dart';
import 'package:prmda/pages/koritsa_menu.dart';
import 'package:prmda/pages/gavydina_menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // Start with the entry animation page
      routes: {
        '/homepage': (context) => const HomePage(),

        '/regstrationpage': (context) =>  const RegstrPage(),

        '/regstrationpage': (context) =>  const RegstrPage(),

        '/SosiskiMenu': (context) => const SosiskiMenu(),
        '/KrevitkiMenu': (context) => const KrevitkiMenu(),
        '/KoritsaMenu': (context) => const KoritsaMenu(),
        '/GavydinaMenu': (context) => const GavydinaMenu(),
        '/ONas': (context) => const ONas(),




      },
    );
  }
}