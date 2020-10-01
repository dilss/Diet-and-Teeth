import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/dayly_diet_data_provider.dart';

import '../screens/tabs_screen.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _ModalBottomSheetWidgetState createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  DateTime _selectedDate;
  String _weekDayFollowedByDate;
  @override
  Widget build(BuildContext context) {
    final _daylyDiet = Provider.of<DaylyDietProvider>(context, listen: false);
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
                      : DateFormat('dd/MM/yyyy').format(_selectedDate),
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
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedDate = value;
                        _daylyDiet.date = _selectedDate;
                      });
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
                    );
                  },
                );
              } else {
                Navigator.pop(context); //Dismiss bottom sheet
                String weekDay;
                switch (DateFormat(DateFormat.WEEKDAY).format(_selectedDate)) {
                  case 'Sunday':
                    weekDay = 'Dom';
                    break;
                  case 'Monday':
                    weekDay = 'Seg';
                    break;
                  case 'Tuesday':
                    weekDay = 'Ter';
                    break;
                  case 'Wednesday':
                    weekDay = 'Qua';
                    break;
                  case 'Thursday':
                    weekDay = 'Qui';
                    break;
                  case 'Friday':
                    weekDay = 'Sex';
                    break;
                  case 'Saturday':
                    weekDay = 'Sáb';
                    break;
                  default:
                    weekDay = 'Hoje';
                }
                _weekDayFollowedByDate = weekDay +
                    '   ' +
                    DateFormat('dd/MM/yyyy').format(_selectedDate);
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
