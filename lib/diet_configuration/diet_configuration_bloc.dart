import 'dart:async';
import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:flutter/foundation.dart';

import 'daily_diet_model.dart';

class DietConfigurationBloc {
  final Database database;
  final StreamController<DailyDiet> _controller = StreamController<DailyDiet>();

  DietConfigurationBloc({@required this.database});

  Stream<DailyDiet> get dietConfigStream => _controller.stream;
  DailyDiet _model = DailyDiet();

  void dispose() {
    _controller.close();
  }

  // void updateWith({
  //   bool modified,
  //   bool savingRequested,
  //   bool savingInProgress,
  // }) {
  //   // update model
  //   _model.copyWith(
  //     modified: modified,
  //     savingRequested: savingRequested,
  //     savingInProgress: savingInProgress,
  //   );
  //   // add updated model to the controller
  //   _controller.add(_model);
  // }

  // void saveDiet(DailyDiet diet) {
  //   try {
  //     updateWith(savingRequested: true, savingInProgress: true);
  //     database.setDiet(diet);
  //   } catch (e) {
  //     updateWith(savingInProgress: false);
  //     rethrow;
  //   }
  // }

  // void dietModified() {
  //   updateWith(modified: true);
  // }
}
