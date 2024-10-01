import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prmda/api/FirebaseApi.dart';
import 'package:prmda/home_screen.dart';
import 'package:prmda/pages/cart_page.dart';
import 'package:prmda/pages/login_page.dart';
import 'package:prmda/pages/notification_page.dart';
import 'package:prmda/pages/o_nas.dart';
import 'package:prmda/pages/user_page.dart';
import 'package:prmda/restraunt.dart';
import 'package:prmda/splash-screen.dart';
import 'package:provider/provider.dart';
import 'pages/regstr_page.dart';
import 'pages/home_page.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Restraunt()),
      ],
      child: const MyApp(),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();

  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> _internetCheckFuture;

  @override
  void initState() {
    super.initState();
    _internetCheckFuture = _checkInternetConnection();
  }

  // Метод для проверки интернет-соединения
  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Метод для повторной проверки интернет-соединения
  void _retryConnection() {
    setState(() {
      _internetCheckFuture = _checkInternetConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _internetCheckFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show the splash screen while waiting
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(), // Show splash screen
          );
        } else if (snapshot.hasError || !snapshot.data!) {
          // If there is no internet connection
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No internet connection",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _retryConnection,
                      child: const Text("Try again"),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // If there is an internet connection, start the main app
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(), // Load home screen
            navigatorKey: navigatorKey,
            routes: {
              '/homepage': (context) => const HomePage(),
              '/regstrationpage': (context) => const RegstrPage(),
              '/login': (context) => const LoginPage(),
              '/Cart': (context) => const CartPage(),
              '/userPage': (context) => UserPage(),
              '/ONas': (context) => const ONas(),
              '/notification_screen': (context) => const NotificationPage(),
            },
          );
        }
      },
    );
  }
}