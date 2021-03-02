import 'package:diet_and_teeth_app/diets_dash_board/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board/ui/daily_diet_list_item_widget.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyDietListWidget extends StatelessWidget {
  Widget _buildContent(BuildContext context) {
    final dataBase = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<DailyDiet>>(
      stream: dataBase.dietsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final diets = snapshot.data;
          return diets.isEmpty
              ? LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Nehuma dieta adicionada ainda!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.7,
                          child: Image.asset('assets/images/waiting.png'),
                        ),
                      ],
                    ),
                  );
                })
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      children: [
                        ...diets.map((e) {
                          return DailyDietListItemWidget(e);
                        }).toList(),
                      ],
                    ),
                  ),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}
