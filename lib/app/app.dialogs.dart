// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType {
  abmClient,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.abmClient: (context, request, completer) =>
        AbmClientDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
