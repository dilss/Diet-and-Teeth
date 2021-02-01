import 'package:diet_and_teeth_app/core/blocs/email_sign_in_bloc.dart';
import 'package:diet_and_teeth_app/core/models/email_sign_in_model.dart';
import 'package:diet_and_teeth_app/core/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class EmailSignInForm extends StatefulWidget {
  final EmailSignInBloc bloc;

  const EmailSignInForm({Key key, @required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<EmailSignInBloc>(
      create: (_) => EmailSignInBloc(auth: auth),
      child: Consumer<EmailSignInBloc>(
        builder: (_, bloc, __) => EmailSignInForm(
          bloc: bloc,
        ),
      ),
      dispose: (_, bloc) => bloc.dispose(),
    );
  }

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _trySubmit(EmailSignInModel model) async {
    try {
      print('Email: ${model.email}, password: ${model.password}');
      await widget.bloc.submit();
    } on Exception catch (e) {
      // showExceptionAlertDialog(
      //   context,
      //   title: 'Um erro ocorreu!',
      //   exception: e,
      // );
    }
  }

  void toggleFormType() {
    widget.bloc.toggleFormType();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: widget.bloc.modelStream,
        initialData: EmailSignInModel(),
        builder: (context, snapshot) {
          final EmailSignInModel _model = snapshot.data;
          final primaryText = _model.formType == EmailSignInFormType.signIn
              ? 'Entrar'
              : 'Registrar-se';
          final secondaryText = _model.formType == EmailSignInFormType.signIn
              ? 'Criar uma nova conta'
              : 'Já tenho uma conta';
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
                Container(
                  child: Image.asset('assets/images/bigMouth.png'),
                  height: constraints.maxHeight * 0.25,
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: 'E-mail'),
                              controller: _emailController,
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return 'Entre com um endereço de email válido!';
                                }
                                return null;
                              },
                              onChanged: widget.bloc.updateEmail,
                            ),
                            TextFormField(
                              key: ValueKey('password'),
                              controller: _passwordController,
                              decoration: InputDecoration(labelText: 'Senha'),
                              obscureText: true,
                              // validator: (value) {
                              //   if (value.isEmpty || value.length < 6) {
                              //     return 'A senha deve conter no mínimo seis caracteres.';
                              //   }
                              //   return null;
                              // },
                              onChanged: widget.bloc.updatePassword,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            if (_model.isLoading) CircularProgressIndicator(),
                            if (!_model.isLoading)
                              RaisedButton(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    primaryText,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                onPressed: () => _trySubmit(_model),
                              ),
                            if (!_model.isLoading)
                              FlatButton(
                                onPressed: !_model.isLoading
                                    ? () => toggleFormType()
                                    : null,
                                child: Text(secondaryText),
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
        });
  }
}
