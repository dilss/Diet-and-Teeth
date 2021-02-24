class DietConfigurationModel {
  final bool modified;
  final bool savingRequested;
  final bool savingInProgress;

  DietConfigurationModel({
    this.modified = false,
    this.savingRequested = false,
    this.savingInProgress = false,
  });

  DietConfigurationModel copyWith({
    bool modified,
    bool savingRequested,
    bool savingInProgress,
  }) {
    return DietConfigurationModel(
      modified: modified ?? this.modified,
      savingRequested: savingRequested ?? this.savingRequested,
      savingInProgress: savingInProgress ?? this.savingInProgress,
    );
  }
}
