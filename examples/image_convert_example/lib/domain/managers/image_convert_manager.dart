import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:path/path.dart' as path;

import '../../data/enums/image_convert_result.dart';

class ImageConvertManager {
  const ImageConvertManager();

  Future<ImageConvertResult> convert({
    required String imagePath,
    required String outputDirectory,
  }) async {
    try {
      // Читаем исходное изображение.
      final image = await File(imagePath).readAsBytes();

      // Конвертируем изображение в PNG формат.
      final pngImageBytes = _convertToPng(image);

      // Если не удалось конверитровать изображение, возвращаем соответствующий
      // статус.
      if (pngImageBytes == null) {
        return ImageConvertResult.error;
      }

      // Формируем путь к новому файлу.
      final fileName = path.basenameWithoutExtension(imagePath);
      final outputPath = path.join(outputDirectory, '$fileName.png');

      // Сохраняем файл.
      await File(outputPath).writeAsBytes(pngImageBytes);

      return ImageConvertResult.success;
    } on Object catch (_) {
      // В случае возникновения ошибки возвращаем соответствующий статус.
      return ImageConvertResult.error;
    }
  }

  Uint8List? _convertToPng(Uint8List bytes) {
    final image = decodeImage(bytes);

    if (image == null) {
      return null;
    }

    return encodePng(image);
  }
}
