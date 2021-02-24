import 'dart:async';
import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:diet_and_teeth_app/diet_configuration/daily_diet_data.dart';
import 'package:diet_and_teeth_app/diet_configuration/diet_configuration_model.dart';
import 'package:flutter/foundation.dart';

class DietConfigurationBloc {
  final Database database;
  final StreamController<DietConfigurationModel> _controller =
      StreamController<DietConfigurationModel>();

  DietConfigurationBloc({@required this.database});

  Stream<DietConfigurationModel> get dietConfigStream => _controller.stream;
  DietConfigurationModel _model = DietConfigurationModel();

  void dispose() {
    _controller.close();
  }

  void updateWith({
    bool modified,
    bool savingRequested,
    bool savingInProgress,
  }) {
    // update model
    _model.copyWith(
      modified: modified,
      savingRequested: savingRequested,
      savingInProgress: savingInProgress,
    );
    // add updated model to the controller
    _controller.add(_model);
  }

  void saveDiet(DailyDiet diet) {
    try {
      updateWith(savingRequested: true, savingInProgress: true);
      database.setDiet(diet);
    } catch (e) {
      updateWith(savingInProgress: false);
      rethrow;
    }
  }

  void dietModified() {
    updateWith(modified: true);
  }
}
