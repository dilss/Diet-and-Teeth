import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import '../models/data_models/dayly_diet_data.dart';

import '../providers/diets_list_provider.dart';

import '../screens/tabs_screen.dart';

import '../utils/utils.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _ModalBottomSheetWidgetState createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  DateTime _selectedDate;
  String _weekDayFollowedByDate;
  @override
  Widget build(BuildContext context) {
    final _daylyDiet = Provider.of<DaylyDiet>(context, listen: false);
    final _daylyDietList = Provider.of<DietsList>(context, listen: false);
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
                        accentTextTheme: Theme.of(context).accentTextTheme,
                        textButtonTheme: Theme.of(context).textButtonTheme,
                        colorScheme: ColorScheme.light(
                          primary: Theme.of(context).primaryColor,
                        ),
                      ),
                    ).then((value) {
                      if (value == null) {
                        return;
                      }
                      _daylyDietList.items.forEach((element) {
                        if (element.date == _selectedDate) {
                          final response = showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Já exite uma dieta salva para o dia selecionado! Deseja sobrescrever-la?',
                              ),
                              actions: [],
                            ),
                          );
                        }
                      });
                      setState(() {
                        _selectedDate = value;
                      });
                      _daylyDiet.date = _selectedDate;
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
              } else {
                Navigator.pop(context); //Dismiss bottom sheet
                _weekDayFollowedByDate =
                    DevUtils.getFormatedDate(_selectedDate);
                Navigator.pushNamed(context, TabsScreen.routeName,
                    arguments: _weekDayFollowedByDate);
              }
            },
          ),
        ],
      ),
    );
  }
}
