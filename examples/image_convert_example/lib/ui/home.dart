import 'package:flutter/material.dart';

import 'pages/image_page/image_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(
          child: ImagePage(),
        ),
      );
}
