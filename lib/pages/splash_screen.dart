import 'package:flutter/material.dart';
//Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
//pages
import '../services/navigation_services.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitialization;
  const SplashScreen({required Key key, required this.onInitialization})
      : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _setup().then(
      (_) => widget.onInitialization(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatme',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          dialogBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0)),
      home: Scaffold(
        body: Center(
            child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.jpeg'))),
        )),
      ),
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationServices>(NavigationServices());
  }
}
