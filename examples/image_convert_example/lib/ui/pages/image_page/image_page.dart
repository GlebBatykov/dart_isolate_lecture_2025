import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import '../../../di/scope_container.dart';
import 'add_image_button.dart';
import 'image_list.dart';
import 'save_button.dart';
import 'use_isolate_button.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) => ScopeBuilder<AppScope>.withPlaceholder(
        builder: (_, scope) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              UseIsolateButton(),
              AddImageButton(),
              SaveImageButton(),
              Expanded(
                child: ImageList(),
              ),
            ],
          ),
        ),
      );
}
