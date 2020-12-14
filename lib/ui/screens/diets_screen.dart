import 'package:diet_and_teeth_app/core/models/daily_diet_data.dart';
import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/modal_bottom_sheet_widget.dart';
import '../widgets/cario_chart_widget.dart';
import '../widgets/daily_diet_list_widget.dart';

class DietsScreen extends StatelessWidget {
  void _startAddingNewDaylyDiet(BuildContext context) {
    var _database = Provider.of<Database>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return MultiProvider(
          providers: [
            Provider(
              create: (ctx) => DailyDiet(),
            ),
            Provider<Database>.value(value: _database),
          ],
          child: ModalBottomSheetWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final availableSize = constraints.maxHeight;
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restaurant),
          onPressed: () {
            _startAddingNewDaylyDiet(context);
          },
        ),
        body: Container(
          height: availableSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: availableSize * 0.3,
                child: CarioChartWidget(),
              ),
              SizedBox(
                height: availableSize * 0.01,
              ),
              Container(
                height: availableSize * 0.65,
                child: DailyDietListWidget(),
              )
            ],
          ),
        ),
      );
    });
  }
}
