import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import '../pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;

  final void Function(
    String email,
    String password,
    String username,
    PickedFile image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  PickedFile _userImageFile;
  void _pickedImage(PickedFile image) {
    _userImageFile = image;
  }

  var _isLogin = true;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();

    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('É preciso selecionar uma foto.'),
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword,
        _userName.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return ListView(
        padding: EdgeInsets.only(top: 50),
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Image.asset('assets/images/odontoPediatria.png'),
            height: constraints.maxHeight * 0.05,
          ),
          _isLogin
              ? Container(
                  child: Image.asset('assets/images/children.png'),
                  height: constraints.maxHeight * 0.25,
                  margin: EdgeInsets.only(bottom: 30),
                )
              : Container(
                  child: UserImagePicker(_pickedImage),
                  margin: EdgeInsets.only(bottom: 30),
                ),
          Text(
            'Dieta E Dentes',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'KidsHandwriting',
                fontSize: constraints.maxHeight * 0.06,
                color: Theme.of(context).primaryColor),
          ),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'E-mail'),
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Entre com um endereço de email válido!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userEmail = value;
                        },
                      ),
                      if (!_isLogin)
                        TextFormField(
                          key: ValueKey('username'),
                          decoration: InputDecoration(labelText: 'Usuário'),
                          validator: (value) {
                            if (value.isEmpty || value.length < 4) {
                              return 'O nome do usuário deve conter pelo menos 4 caracters.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _userName = value;
                          },
                        ),
                      TextFormField(
                        key: ValueKey('password'),
                        decoration: InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return 'A senha deve conter no mínimo seis caracteres.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userPassword = value;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      if (widget.isLoading) CircularProgressIndicator(),
                      if (!widget.isLoading)
                        RaisedButton(
                          child: Text(_isLogin ? 'Entrar' : 'Registrar-se'),
                          onPressed: _trySubmit,
                        ),
                      if (!widget.isLoading)
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(_isLogin
                              ? 'Criar uma nova conta '
                              : 'Já tenho uma conta'),
                          textColor: Theme.of(context).primaryColor,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
