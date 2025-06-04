import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import '../../../di/scope_container.dart';
import 'image_item.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) => ScopeBuilder<AppScope>.withPlaceholder(
        builder: (_, scope) {
          final stateHolder = scope.imageItemsStateHolder;

          return StreamBuilder(
            stream: stateHolder.stream,
            initialData: stateHolder.getState(),
            builder: (_, snapshot) {
              final items = snapshot.requireData;

              if (items.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
                itemCount: items.length,
                itemBuilder: (_, index) => ImageItem(
                  state: items[index],
                  imagePageManager: scope.imagePageManager,
                ),
              );
            },
          );
        },
      );
}
