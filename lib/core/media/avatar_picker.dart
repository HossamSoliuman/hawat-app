import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../l10n.dart';
import '../theme/tokens.dart';

enum PhotoChoice { gallery, camera, remove }

/// Gallery, camera, and (when there is a photo) remove.
Future<PhotoChoice?> showPhotoChoices(BuildContext context, {required bool hasPhoto}) {
  final l = context.l10n;
  return showModalBottomSheet<PhotoChoice>(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: Text(l.pickFromGallery),
            onTap: () => Navigator.pop(context, PhotoChoice.gallery),
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera_outlined),
            title: Text(l.takePhoto),
            onTap: () => Navigator.pop(context, PhotoChoice.camera),
          ),
          if (hasPhoto)
            ListTile(
              leading: Icon(Icons.delete_outline, color: HawatColors.of(context).danger),
              title: Text(l.removePhoto),
              onTap: () => Navigator.pop(context, PhotoChoice.remove),
            ),
        ],
      ),
    ),
  );
}

/// Picks a photo and returns it as a JPEG of at most 512px a side, or null
/// when the owner backs out. Small enough to upload on a weak signal at the port.
Future<Uint8List?> pickAvatar(PhotoChoice source) async {
  final file = await ImagePicker().pickImage(
    source: source == PhotoChoice.camera ? ImageSource.camera : ImageSource.gallery,
    maxWidth: avatarMaxSide.toDouble(),
    maxHeight: avatarMaxSide.toDouble(),
  );
  if (file == null) return null;
  return FlutterImageCompress.compressWithList(
    await file.readAsBytes(),
    minWidth: avatarMaxSide,
    minHeight: avatarMaxSide,
    quality: 82,
    format: CompressFormat.jpeg,
  );
}

const avatarMaxSide = 512;
