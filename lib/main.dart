import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prmda/home_screen.dart';
import 'package:prmda/pages/cart_page.dart';
import 'package:prmda/pages/login_page.dart';
import 'package:prmda/pages/meatCategories_page.dart';
import 'package:prmda/pages/o_nas.dart';
import 'package:prmda/pages/user_page.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';
import 'pages/regstr_page.dart';
import 'pages/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Restraunt()),
      ],
      child: const MyApp(),
    )
  );
}

// Your current platform's firebase options
final FirebaseOptions currentPlatformOptions = DefaultFirebaseOptions.currentPlatform;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(), // Start with the entry animation page
      routes: {
        '/homepage': (context) => const HomePage(),
        '/regstrationpage': (context) => const RegstrPage(),
        '/login': (context) =>  const LoginPage(),
        '/Cart': (context) =>  const CartPage(),
        '/userPage': (context) =>  UserPage(),
        '/ONas': (context) => const ONas(),




      },
    );
  }
  
}