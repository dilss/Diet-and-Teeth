import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(PickedFile pickedImage) imagePickFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  PickedFile _image;

  Future getImage() async {
    final imagePicker = ImagePicker();
    var image = await imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.front,
    );

    setState(() {
      _image = image;
    });
    widget.imagePickFn(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[350],
          backgroundImage: _image != null ? FileImage(File(_image.path)) : null,
          child: _image == null
              ? IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {
                    getImage();
                  },
                )
              : null,
        ),
        if (_image != null)
          SizedBox(
            height: 10,
          ),
        if (_image != null)
          FlatButton(
            onPressed: () {
              setState(() {
                _image = null;
              });
            },
            child: Text('Escolher outra'),
            textColor: Theme.of(context).primaryColor,
          ),
      ],
    );
  }
}
