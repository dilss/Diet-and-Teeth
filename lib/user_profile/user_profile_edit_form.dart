import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:diet_and_teeth_app/general_use_widgets/widgets_methods.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/services/storage.dart';
import 'package:diet_and_teeth_app/user_profile/user_image_picker.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileEditForm extends StatefulWidget {
  final UserProfileModel userData;
  UserProfileEditForm({Key key, this.userData}) : super(key: key);

  @override
  _UserProfileEditFormState createState() => _UserProfileEditFormState();
}

class _UserProfileEditFormState extends State<UserProfileEditForm> {
  File _userImageFile;

  @override
  Widget build(BuildContext context) {
    final _connectivity = Provider.of<Connectivity>(context, listen: false);
    final _database = Provider.of<Database>(context, listen: false);
    final textInputFormatters = {
      'phoneFormatter':
          MaskTextInputFormatter(mask: '+## (##) #####-####', filter: {
        "#": RegExp(r'[0-9]'),
      }),
      'dateOfBirthFormatter':
          MaskTextInputFormatter(mask: '##/##/####', filter: {
        "#": RegExp(r'[0-9]'),
      })
    };

    final textControllers = {
      'nameController': TextEditingController(text: widget.userData.name),
      'surnameController': TextEditingController(text: widget.userData.surname),
      'phoneController': TextEditingController(text: widget.userData.cellPhone),
      'dateOfBirthController':
          TextEditingController(text: widget.userData.dateOfBirth),
      'districtController':
          TextEditingController(text: widget.userData.district),
      'cityController': TextEditingController(text: widget.userData.city),
    };

    void _getUserImageFile(File imageFile) {
      _userImageFile = imageFile;
    }

    Future<String> _uploadImageToStorage({@required File imageFile}) async {
      final _storage = Provider.of<StorageBase>(context, listen: false);
      try {
        final url = await _storage.uploadUserImage(imageFile: imageFile);
        return url;
      } catch (e) {
        rethrow;
      }
    }

    return Form(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: UserImagePicker(
              imagePickCallback: _getUserImageFile,
              currentPictureUrl: widget.userData.pictureUrl,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              enabled: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              textInputAction: TextInputAction.next,
              controller: textControllers['nameController'],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              enabled: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sobrenome',
              ),
              textInputAction: TextInputAction.next,
              controller: textControllers['surnameController'],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              enabled: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefone',
              ),
              inputFormatters: [textInputFormatters['phoneFormatter']],
              textInputAction: TextInputAction.next,
              controller: textControllers['phoneController'],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              enabled: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Data de nascimento',
              ),
              inputFormatters: [textInputFormatters['dateOfBirthFormatter']],
              textInputAction: TextInputAction.next,
              controller: textControllers['dateOfBirthController'],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              enabled: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bairro',
              ),
              textInputAction: TextInputAction.next,
              controller: textControllers['districtController'],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              enabled: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cidade',
              ),
              textInputAction: TextInputAction.done,
              controller: textControllers['cityController'],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                _connectivity.checkConnectivity().then((value) {
                  switch (value) {
                    case ConnectivityResult.mobile:
                    case ConnectivityResult.wifi:
                      if (_userImageFile == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Nenhuma foto selecionada.'),
                            backgroundColor: Theme.of(context).errorColor,
                          ),
                        );
                      }
                      try {
                        _uploadImageToStorage(imageFile: _userImageFile).then(
                            (url) => _database
                                .updateUserProfile(
                                  UserProfileModel(
                                    name:
                                        textControllers['nameController'].text,
                                    surname:
                                        textControllers['surnameController']
                                            .text,
                                    cellPhone:
                                        textControllers['phoneController'].text,
                                    dateOfBirth:
                                        textControllers['dateOfBirthController']
                                            .text,
                                    district:
                                        textControllers['districtController']
                                            .text,
                                    city:
                                        textControllers['cityController'].text,
                                    email: widget.userData.email,
                                    pictureUrl: url,
                                  ),
                                )
                                .then((_) =>
                                    showCheckSuccessAndPopScreen(context)));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Um Erro ocorreu.'),
                            backgroundColor: Theme.of(context).errorColor,
                          ),
                        );
                      }
                      break;
                    case ConnectivityResult.none:
                      break;
                    default:
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
