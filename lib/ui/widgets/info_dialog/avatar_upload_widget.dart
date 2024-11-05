import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/dialogs/info_alert/info_alert_dialog_model.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/ui/widgets/avatar_photro_widget.dart';

class AvatarUploadWidget extends ViewModelWidget<AbmClienteDialogModel> {
  const AvatarUploadWidget({super.key});

  @override
  Widget build(BuildContext context, AbmClienteDialogModel viewModel) => Center(
        child: GestureDetector(
            onTap: viewModel.uploadImage,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (viewModel.newClient.photo == null) $graphics.uploadImage,
                if ((viewModel.newClient.photo?.isNotEmpty ?? false) ||
                    viewModel.isImageUpload) ...[
                  AvatarPhotoWidget(
                    url: viewModel.newClient.photo ?? '',
                    isLoading: viewModel.isImageUpload,
                  ),
                  SizedBox(width: 119, height: 119, child: $graphics.overlay),
                ],
              ],
            )),
      );
}
