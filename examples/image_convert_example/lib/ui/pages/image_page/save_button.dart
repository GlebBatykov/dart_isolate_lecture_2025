import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import '../../../di/scope_container.dart';
import '../../../domain/extensions/image_item_list_extension.dart';

class SaveImageButton extends StatelessWidget {
  const SaveImageButton({super.key});

  @override
  Widget build(BuildContext context) => ScopeBuilder<AppScope>.withPlaceholder(
        builder: (_, scope) {
          final stateHolder = scope.imageItemsStateHolder;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Save images: ',
                style: TextStyle(fontSize: 20),
              ),
              StreamBuilder(
                stream: stateHolder.stream
                    .map((items) => items.hasSelectedImages)
                    .distinct(),
                initialData: stateHolder.getState().hasSelectedImages,
                builder: (_, snapshort) {
                  final hasSelectedImages = snapshort.requireData;

                  return IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: hasSelectedImages ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      scope.imagePageManager.saveImages();
                    },
                  );
                },
              ),
            ],
          );
        },
      );
}
