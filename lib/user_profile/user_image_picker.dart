import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File imageFile) imagePickCallback;
  final String currentPictureUrl;

  const UserImagePicker(
      {Key key, this.imagePickCallback, this.currentPictureUrl})
      : super(key: key);
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
    File file = File(_pickedImage.path);
    widget.imagePickCallback(file);
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
          radius: 75,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/profile.png'),
            foregroundImage: _pickedImage != null
                ? FileImage(
                    File(_pickedImage.path),
                  )
                : widget.currentPictureUrl != ''
                    ? NetworkImage(widget.currentPictureUrl)
                    : null,
          ),
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
