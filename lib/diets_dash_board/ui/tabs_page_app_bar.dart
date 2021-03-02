import 'package:connectivity/connectivity.dart';
import 'package:diet_and_teeth_app/diets_dash_board/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board/ui/error_dialog.dart';
import 'package:diet_and_teeth_app/diets_dash_board/ui/successfully_saved_dialog.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/utils/const_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar getTabsPageAppBar(
    {BuildContext context, String title, String appBarBottomText}) {
  return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: FlatButton(
            splashColor: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Salvar',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            onPressed: () => _saveDietInDatabase(context: context),
          ),
        ),
      ],
      title: Text(title),
      bottom: PreferredSize(
        child: Text(
          appBarBottomText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        preferredSize: Size.fromHeight(16),
      ));
}

Future<void> _saveDietInDatabase({BuildContext context}) async {
  final connectivity = Provider.of<Connectivity>(context, listen: false);
  final database = Provider.of<Database>(context, listen: false);
  DailyDiet diet = Provider.of<DailyDiet>(context, listen: false);

  final status = await connectivity.checkConnectivity();
  switch (status) {
    case ConnectivityResult.mobile:
    case ConnectivityResult.wifi:
      try {
        await database.setDiet(diet);
        ConstData.resetSelectedItems();
        _showCheckSuccessAndReturnToInicialScreen(context);
      } catch (e) {
        rethrow;
      }
      break;
    case ConnectivityResult.none:
      _showErrorDialog(context, "Erro: Sem conexão com a internet!");
      break;
    default:
      _showErrorDialog(context, "Um erro ocorreu.");
  }
}

void _showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => ErrorDialog(),
  );
}

void _showCheckSuccessAndReturnToInicialScreen(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => SuccessfullySavedDialog(),
  );
}
