import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../data/state/image_page/image_item_state.dart';
import '../../../domain/managers/image_page_manager.dart';

class ImageItem extends StatelessWidget {
  final ImageItemState state;
  final ImagePageManager imagePageManager;

  const ImageItem({
    required this.state,
    required this.imagePageManager,
    super.key,
  });

  @override
  Widget build(BuildContext context) => state.map(
        unselected: (state) => _ImageItemUnselected(
          id: state.id,
          title: state.name,
          imagePageManager: imagePageManager,
        ),
        selected: (state) => _ImageItemSelected(
          id: state.id,
          title: state.name,
          imagePageManager: imagePageManager,
        ),
        process: (state) => _ImageItemProcess(
          title: state.name,
        ),
        error: (state) => _ImageItemError(
          id: state.id,
          title: state.name,
          imagePageManager: imagePageManager,
        ),
        success: (state) => _ImageItemSuccess(
          id: state.id,
          title: state.name,
          imagePageManager: imagePageManager,
        ),
      );
}

class _ImageItemUnselected extends StatelessWidget {
  final String id;
  final String title;
  final ImagePageManager imagePageManager;

  const _ImageItemUnselected({
    required this.id,
    required this.title,
    required this.imagePageManager,
  });

  @override
  Widget build(BuildContext context) => _ImageItemCard(
        onTap: () {
          imagePageManager.selectImage(id);
        },
        title: title,
        backgroundColor: Colors.grey.withOpacity(0.2),
        right: _DeleteItemButton(
          id: id,
          imagePageManager: imagePageManager,
        ),
      );
}

class _ImageItemSelected extends StatelessWidget {
  final String id;
  final String title;
  final ImagePageManager imagePageManager;

  const _ImageItemSelected({
    required this.id,
    required this.title,
    required this.imagePageManager,
  });

  @override
  Widget build(BuildContext context) => _ImageItemCard(
        onTap: () {
          imagePageManager.unselectImage(id);
        },
        title: title,
        backgroundColor: Colors.grey.withOpacity(0.4),
        right: _DeleteItemButton(
          id: id,
          imagePageManager: imagePageManager,
        ),
      );
}

class _ImageItemProcess extends StatelessWidget {
  final String title;

  const _ImageItemProcess({
    required this.title,
  });

  @override
  Widget build(BuildContext context) => _ImageItemCard(
        title: title,
        right: const Padding(
          padding: EdgeInsetsDirectional.only(end: 16),
          child: SpinKitDualRing(
            size: 25,
            lineWidth: 4,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(0.3),
      );
}

class _ImageItemError extends StatelessWidget {
  final String id;
  final String title;
  final ImagePageManager imagePageManager;

  const _ImageItemError({
    required this.id,
    required this.title,
    required this.imagePageManager,
  });

  @override
  Widget build(BuildContext context) => _ImageItemCard(
        title: title,
        backgroundColor: Colors.red.withOpacity(0.2),
        right: _DeleteItemButton(
          id: id,
          imagePageManager: imagePageManager,
        ),
      );
}

class _ImageItemSuccess extends StatelessWidget {
  final String id;
  final String title;
  final ImagePageManager imagePageManager;

  const _ImageItemSuccess({
    required this.id,
    required this.title,
    required this.imagePageManager,
  });

  @override
  Widget build(BuildContext context) => _ImageItemCard(
        title: title,
        backgroundColor: Colors.green.withOpacity(0.2),
        right: _DeleteItemButton(
          id: id,
          imagePageManager: imagePageManager,
        ),
      );
}

class _DeleteItemButton extends StatelessWidget {
  final String id;
  final ImagePageManager imagePageManager;

  const _DeleteItemButton({
    required this.id,
    required this.imagePageManager,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          imagePageManager.deleteImage(id);
        },
        icon: const Icon(Icons.close),
      );
}

class _ImageItemCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Widget? right;

  const _ImageItemCard({
    required this.title,
    required this.backgroundColor,
    this.onTap,
    this.right,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ImageItemInfo(title: title),
              if (right != null) right!,
            ],
          ),
        ),
      );
}

class _ImageItemInfo extends StatelessWidget {
  final String title;

  const _ImageItemInfo({
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
