import 'package:diet_and_teeth_app/email_sign_in/email_sign_in_bloc.dart';
import 'package:diet_and_teeth_app/email_sign_in/email_sign_in_model.dart';
import 'package:diet_and_teeth_app/services/auth.dart';
import 'package:diet_and_teeth_app/utils/custom_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<void> _trySubmit(EmailSignInModel model) async {
    try {
      await widget.bloc.submit();
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AuthExceptionHandler.generateExceptionMessage(status),
          ),
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro desconhecido"),
        ),
      );
    }
  }

  void _toggleFormType() {
    widget.bloc.toggleFormType();
    _emailController.clear();
    _passwordController.clear();
  }

  void _emailEditingComplete(bool changeFocus) {
    final newFocus = changeFocus ? _passwordFocusNode : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: widget.bloc.modelStream,
        initialData: EmailSignInModel(),
        builder: (context, snapshot) {
          final EmailSignInModel _model = snapshot.data;
          final submitEneabled =
              _model.validEmail && _model.validPassword && !_model.isLoading;
          final changeFocus = _model.validEmail;
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
                !_model.isLoading
                    ? Text(
                        'Dieta E Dentes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'KidsHandwriting',
                            fontSize: constraints.maxHeight * 0.06,
                            color: Theme.of(context).primaryColor),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
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
                              textInputAction: TextInputAction.next,
                              enabled: !_model.isLoading,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                errorText:
                                    !_model.validEmail && _model.submitted
                                        ? _model.emailErrorMesssage
                                        : null,
                              ),
                              focusNode: _emailFocusNode,
                              controller: _emailController,
                              onChanged: widget.bloc.updateEmail,
                              onEditingComplete: () =>
                                  _emailEditingComplete(changeFocus),
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              enabled: !_model.isLoading,
                              focusNode: _passwordFocusNode,
                              key: ValueKey('password'),
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                errorText:
                                    !_model.validPassword && _model.submitted
                                        ? _model.passwordErrorMessage
                                        : null,
                              ),
                              obscureText: true,
                              onChanged: widget.bloc.updatePassword,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  _model.primaryButtonText,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              onPressed: submitEneabled
                                  ? () => _trySubmit(_model)
                                  : null,
                            ),
                            TextButton(
                              onPressed: !_model.isLoading
                                  ? () => _toggleFormType()
                                  : null,
                              child: Text(_model.secondaryButtonText),
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
