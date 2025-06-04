import '../../data/state/image_page/image_item_state.dart';

extension ImageItemListExtension on List<ImageItemState> {
  bool get hasSelectedImages =>
      any((item) => item is ImageItemStateSelectedState);
}
