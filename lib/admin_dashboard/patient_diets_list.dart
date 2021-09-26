import 'package:flutter/material.dart';

import '../diets_dashboard/models/daily_diet_model.dart';

class PatientDietsList extends StatelessWidget {
  final List<DailyDiet> diets;

  const PatientDietsList({
    @required this.diets,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
