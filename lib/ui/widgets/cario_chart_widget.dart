import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:diet_and_teeth_app/diet_configuration/daily_diet_model.dart';
import 'package:diet_and_teeth_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class CarioChartWidget extends StatelessWidget {
  void setChartWeekDays(List<CarioData> _data) {
    for (int index = 0; index < 7; index++) {
      _data[6 - index].weekDay = DevUtils.getWeekDay(
          date: DateTime.now().subtract(Duration(days: index)), short: true);
    }
  }

  void setCarioLevel(List<DailyDiet> diets, List<CarioData> _data) {
    List<String> list = [];
    for (int index = 0; index < 7; index++) {
      list.add(
        DevUtils.getFormatedDate(
          DateTime.now().subtract(
            Duration(days: index),
          ),
        ),
      );
    }
    for (int index = 0; index < 7; index++) {
      var daylyDiet = diets.firstWhere(
        (element) {
          return element.date == list[index];
        },
        orElse: () {
          return null;
        },
      );

      if (daylyDiet != null) {
        _data[6 - index].carioLevel = daylyDiet.harmfulPotential;
      } else {
        _data[6 - index].carioLevel = 0;
      }
    }
  }

  Widget build(BuildContext context) {
    var _data = [
      CarioData(weekDay: 'Dom', carioLevel: 10),
      CarioData(weekDay: 'Seg', carioLevel: 25),
      CarioData(weekDay: 'Ter', carioLevel: 30),
      CarioData(weekDay: 'Qua', carioLevel: 70),
      CarioData(weekDay: 'Qui', carioLevel: 35),
      CarioData(weekDay: 'Sex', carioLevel: 62),
      CarioData(weekDay: 'Hoje', carioLevel: 54),
    ];

    Widget _buildContent(BuildContext context) {
      final _database = Provider.of<Database>(context, listen: false);
      return StreamBuilder(
          stream: _database.dietsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              setChartWeekDays(_data);
              setCarioLevel(snapshot.data, _data);
              final seriesList = [
                charts.Series(
                  id: 'Potencial Cariogênico',
                  domainFn: (CarioData carioData, _) => carioData.weekDay,
                  measureFn: (CarioData carioData, _) => carioData.carioLevel,
                  colorFn: (CarioData carioData, _) => carioData.color,
                  data: _data,
                ),
              ];
              return charts.BarChart(
                seriesList,
                animate: true,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    }

    return Card(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildContent(context),
        ),
      ),
      elevation: 5,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class CarioData {
  CarioData({this.weekDay, this.carioLevel});
  String weekDay;
  int carioLevel;
  final charts.Color color = charts.ColorUtil.fromDartColor(Colors.cyan);
}
