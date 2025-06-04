import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import '../../../di/scope_container.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) => ScopeBuilder<AppScope>.withPlaceholder(
        builder: (_, scope) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Select images:',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                scope.imagePageManager.pickImages();
              },
            ),
          ],
        ),
      );
}
