import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../data/enums/image_convert_result.dart';
import '../../data/models/image_metadata.dart';
import '../../data/state/image_page/image_item_state.dart';
import '../../data/state/image_page/image_items_state_holder.dart';
import '../../data/state/image_page/usage_isolate_state_holder.dart';
import '../service/image_convert/image_convert_service.dart';
import 'image_convert_manager.dart';

class ImagePageManager {
  final ImageConvertService _imageConvertService;
  final ImageConvertManager _imageConvertManager;
  final ImageItemsStateHolder _imageItemsStateHolder;
  final UsageIsolateStateHolder _usageIsolateStateHolder;

  const ImagePageManager({
    required ImageConvertService imageConvertService,
    required ImageConvertManager imageConvertManager,
    required ImageItemsStateHolder imageItemsStateHolder,
    required UsageIsolateStateHolder usageIsolateStateHolder,
  })  : _imageConvertService = imageConvertService,
        _imageConvertManager = imageConvertManager,
        _imageItemsStateHolder = imageItemsStateHolder,
        _usageIsolateStateHolder = usageIsolateStateHolder;

  void selectImage(String id) {
    _imageItemsStateHolder.selectImageItem(id);
  }

  void unselectImage(String id) {
    _imageItemsStateHolder.unselectImageItem(id);
  }

  void deleteImage(String id) {
    _imageItemsStateHolder.deleteImage(id);
  }

  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Select .jpg images:',
      allowedExtensions: const ['jpg'],
      type: FileType.custom,
      allowMultiple: true,
    );

    if (result == null) {
      return;
    }

    final images = result.files
        .map(
          (file) {
            final path = file.path;

            if (path == null) {
              return null;
            }

            return ImageMetadata(
              id: const Uuid().v4(),
              name: file.name,
              path: path,
            );
          },
        )
        .whereNotNull()
        .toList();

    _imageItemsStateHolder.addImages(images);
  }

  Future<void> saveImages() async {
    final isGranted = await Permission.manageExternalStorage.isGranted;

    if (!isGranted) {
      final status = await Permission.manageExternalStorage.request();

      if (status != PermissionStatus.granted) {
        return;
      }
    }

    final directory = await FilePicker.platform.getDirectoryPath(
      dialogTitle: 'Select directory: ',
    );

    if (directory == null) {
      return;
    }

    final selectedItems = _imageItemsStateHolder.selectedImages;

    if (selectedItems.isEmpty) {
      return;
    }

    _imageItemsStateHolder.setProcessItems(
      selectedItems.map((item) => item.id).toList(),
    );

    for (final item in selectedItems) {
      _convertImage(
        item,
        directory,
      );
    }
  }

  Future<void> _convertImage(
    ImageItemStateSelectedState item,
    String directory,
  ) async {
    ImageConvertResult result;

    if (_usageIsolateStateHolder.getState()) {
      result = await _imageConvertService.convert(
        id: item.id,
        imagePath: item.path,
        outputDirectory: directory,
      );
    } else {
      result = await _imageConvertManager.convert(
        imagePath: item.path,
        outputDirectory: directory,
      );
    }

    switch (result) {
      case ImageConvertResult.success:
        _imageItemsStateHolder.setSuccessItem(item.id);
        break;
      case ImageConvertResult.error:
        _imageItemsStateHolder.setErrorItem(item.id);
        break;
    }
  }
}
