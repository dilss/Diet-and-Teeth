import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
  final UserProfileModel model;
  const ProfileInfoWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).primaryColor;
    final _borderWidth = 3.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 85,
              // This outermost CircleAvatar with diferent raduius and background is to give the inner
              // one a border with the background color.
              backgroundColor: _color,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/profile.png'),
                foregroundImage: model.pictureUrl != ''
                    ? NetworkImage(model.pictureUrl)
                    : null,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${model.name} ${model.surname}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'KidsHandwriting',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: _borderWidth),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.phone),
                  SizedBox(
                    width: 20,
                  ),
                  Text(model.cellPhone),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: _borderWidth),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.email),
                  SizedBox(
                    width: 20,
                  ),
                  Text(model.email),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: _borderWidth),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Data de nascimento:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(model.dateOfBirth),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: _borderWidth),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Bairro:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(model.district),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: _borderWidth),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cidade:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(model.city),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
