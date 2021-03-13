import 'package:connectivity/connectivity.dart';
import 'package:diet_and_teeth_app/general_use_widgets/widgets_methods.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/user_image_picker.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileEditForm extends StatelessWidget {
  final UserProfileModel userData;
  const UserProfileEditForm({Key key, this.userData}) : super(key: key);

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
      'nameController': TextEditingController(text: userData.name),
      'surnameController': TextEditingController(text: userData.surname),
      'phoneController': TextEditingController(text: userData.cellPhone),
      'dateOfBirthController':
          TextEditingController(text: userData.dateOfBirth),
      'districtController': TextEditingController(text: userData.district),
      'cityController': TextEditingController(text: userData.city),
    };
    return Form(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: UserImagePicker(),
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
                      try {
                        _database
                            .updateUserProfile(
                              UserProfileModel(
                                name: textControllers['nameController'].text,
                                surname:
                                    textControllers['surnameController'].text,
                                cellPhone:
                                    textControllers['phoneController'].text,
                                dateOfBirth:
                                    textControllers['dateOfBirthController']
                                        .text,
                                district:
                                    textControllers['districtController'].text,
                                city: textControllers['cityController'].text,
                                email: userData.email,
                              ),
                            )
                            .then((_) => showCheckSuccessAndPopScreen(context));
                      } catch (e) {}
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
