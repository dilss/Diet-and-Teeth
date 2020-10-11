import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/diets_list_provider.dart';
import './dayly_diet_list_item_widget.dart';

class DaylyDietListWidget extends StatefulWidget {
  @override
  _DaylyDietListWidgetState createState() => _DaylyDietListWidgetState();
}

class _DaylyDietListWidgetState extends State<DaylyDietListWidget> {
  @override
  Widget build(BuildContext context) {
    final _dietListData = Provider.of<DietsList>(context);
    return _dietListData != null && _dietListData.items.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                children: [
                  ..._dietListData.items.map((e) {
                    return DaylyDietListItemWidget(e);
                  }).toList(),
                ],
              ),
            ),
          )
        : LayoutBuilder(builder: (context, constraints) {
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
          });
  }
}
