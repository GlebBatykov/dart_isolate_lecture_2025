import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const home = Home();

    if (Platform.isIOS) {
      return const CupertinoApp(
        home: home,
      );
    }

    return const MaterialApp(
      home: home,
    );
  }
}
