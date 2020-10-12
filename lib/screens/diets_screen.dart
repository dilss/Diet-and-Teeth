import 'package:flutter/material.dart';

import '../widgets/modal_bottom_sheet_widget.dart';
import '../widgets/cario_chart_widget.dart';
import '../widgets/dayly_diet_list_widget.dart';

class DietsScreen extends StatelessWidget {
  void _startAddingNewDaylyDiet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ModalBottomSheetWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final availableSize = MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top -
    //     myAppBar.preferredSize.height -
    //     kBottomNavigationBarHeight;
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
                child: DaylyDietListWidget(),
              )
            ],
          ),
        ),
      );
    });
  }
}
