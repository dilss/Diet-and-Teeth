import 'package:diet_and_teeth_app/diets_dash_board.dart/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board.dart/ui/tabs_screen.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _ModalBottomSheetWidgetState createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  DateTime _selectedDate;
  DailyDiet itemFound;
  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    final diet = Provider.of<DailyDiet>(context, listen: false);
    return StreamBuilder<List<DailyDiet>>(
        stream: _database.dietsStream(),
        builder: (context, snapshot) {
          var diets = snapshot.data;
          return Container(
            height: 150,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Nenhuma data selecionada!'
                            : DevUtils.getFormatedDate(_selectedDate),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        child: Text(
                          'Escolha uma data.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          showRoundedDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                            borderRadius: 20,
                            height: MediaQuery.of(context).size.height * 0.4,
                            theme: ThemeData(
                              primaryColor: Theme.of(context).primaryColor,
                              accentColor: Theme.of(context).accentColor,
                              accentTextTheme:
                                  Theme.of(context).accentTextTheme,
                              textButtonTheme:
                                  Theme.of(context).textButtonTheme,
                              colorScheme: ColorScheme.light(
                                primary: Theme.of(context).primaryColor,
                              ),
                            ),
                          ).then((value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedDate = value;
                            });
                            diet.date = DevUtils.getFormatedDate(_selectedDate);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  elevation: 5,
                  child: Text(
                    'Selecionar Alimentos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_selectedDate != null) {
                      itemFound = diets.firstWhere(
                        (element) {
                          return element.date ==
                              DevUtils.getFormatedDate(_selectedDate);
                        },
                        orElse: () {
                          return null;
                        },
                      );
                    }
                    if (_selectedDate == null) {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (ctx) {
                          return AlertDialog(
                            content: Text(
                              'É necessário escolher uma data para a dieta!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: Text('OK'),
                              ),
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        },
                      );
                    } else if (itemFound != null) {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Text(
                              'Já existe uma dieta para o dia escolhido! Deseja apagar e criar outra?',
                            ),
                            actions: [
                              FlatButton(
                                child: Text('NÃO'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                },
                              ),
                              FlatButton(
                                child: Text('SIM'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(true);
                                  _database.deleteDiet(itemFound);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.pop(context); //Dismiss bottom sheet
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              Provider<DailyDiet>.value(value: diet),
                              Provider<Database>.value(value: _database),
                            ],
                            child: TabsScreen(),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
