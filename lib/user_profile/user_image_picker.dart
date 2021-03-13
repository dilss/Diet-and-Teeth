import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  PickedFile _pickedImage;
  Future<void> _pickImage() async {
    final source = await _chooseSourceDiaolog();
    final _pickedImageFile = await ImagePicker().getImage(source: source);
    setState(() {
      _pickedImage = _pickedImageFile;
    });
  }

  Future<ImageSource> _chooseSourceDiaolog() async {
    return await showDialog<ImageSource>(
      context: context,
      barrierDismissible: true,
      builder: (context) => SimpleDialog(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        children: [
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            icon: Icon(Icons.camera_alt_rounded),
            label: Text('Câmera'),
          ),
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            icon: Icon(Icons.image_rounded),
            label: Text('Galeria'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: _pickedImage != null
              ? FileImage(
                  File(_pickedImage.path),
                )
              : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Escolher foto'),
        ),
      ],
    );
  }
}
