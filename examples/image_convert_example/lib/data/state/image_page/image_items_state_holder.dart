import 'dart:collection';

import 'package:state_notifier/state_notifier.dart';

import '../../models/image_metadata.dart';
import 'image_item_state.dart';

class ImageItemsStateHolder extends StateNotifier<List<ImageItemState>> {
  ImageItemsStateHolder() : super(const []);

  UnmodifiableListView<ImageItemState> getState() =>
      UnmodifiableListView(state);

  List<ImageItemStateSelectedState> get selectedImages =>
      state.whereType<ImageItemStateSelectedState>().toList();

  void addImages(List<ImageMetadata> images) {
    if (!mounted) {
      return;
    }

    state = [
      ...state,
      for (final image in images)
        ImageItemState.unselected(
          id: image.id,
          name: image.name,
          path: image.path,
        ),
    ];
  }

  void selectImageItem(String id) {
    if (!mounted) {
      return;
    }

    state = [
      for (final item in state)
        if (item.id == id)
          ImageItemState.selected(
            id: item.id,
            name: item.name,
            path: item.path,
          )
        else
          item
    ];
  }

  void unselectImageItem(String id) {
    if (!mounted) {
      return;
    }

    state = [
      for (final item in state)
        if (item.id == id)
          ImageItemState.unselected(
            id: item.id,
            name: item.name,
            path: item.path,
          )
        else
          item
    ];
  }

  void setProcessItems(List<String> ids) {
    if (!mounted) {
      return;
    }

    state = [
      for (final item in state)
        if (ids.contains(item.id))
          ImageItemState.process(
            id: item.id,
            name: item.name,
            path: item.path,
          )
        else
          item
    ];
  }

  void setErrorItem(String id) {
    if (!mounted) {
      return;
    }

    state = [
      for (final item in state)
        if (item.id == id)
          ImageItemState.error(
            id: item.id,
            name: item.name,
            path: item.path,
          )
        else
          item
    ];
  }

  void setSuccessItem(String id) {
    if (!mounted) {
      return;
    }

    state = [
      for (final item in state)
        if (item.id == id)
          ImageItemState.success(
            id: item.id,
            name: item.name,
            path: item.path,
          )
        else
          item
    ];
  }

  void deleteImage(String id) {
    if (!mounted) {
      return;
    }

    state = state.where((item) => item.id != id).toList();
  }
}
