import 'dart:async';

import 'package:buscador_prueba_bancolombia/views/books/books_view.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    splashTimeout();
  }

  splashTimeout() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
   Navigator.of(context).pushReplacementNamed(BooksView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 150.0)));
  }
}
