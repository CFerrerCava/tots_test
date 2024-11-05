import 'package:flutter/material.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/ui/widgets/avatar_photro_widget.dart';
import 'package:tots_test/ui/widgets/home/dot_item_widget.dart';
import 'package:tots_test/util/item_state.dart';
import 'package:tots_test/util/string_extension.dart';

class ClientItemWidget extends StatelessWidget {
  final ClientsModel client;
  final Function() onEdit;
  final Function() onDelete;
  const ClientItemWidget(
      {super.key,
      required this.client,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: $theme.whiteFFFFFF,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: $theme.black000000,
          )),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          '${client.firstname} ${client.firstname}',
          style: $font.medium.copyWith(
            color: $theme.black0D0D0D,
            letterSpacing: 0.25,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          '${client.email}',
          style: $font.regular.copyWith(
            color: $theme.black0D0D0D,
            letterSpacing: 0.25,
            fontSize: 12,
          ),
        ),
        leading: SizedBox(
            width: 50,
            height: 50,
            child: (client.photo?.isNotEmpty ?? false)
                ? AvatarPhotoWidget(url: client.photo!)
                : $graphics.dash),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemState>>[
            PopupMenuItem<ItemState>(
              value: ItemState.edit,
              onTap: onEdit,
              child: DotItemWidget(
                onPressed: onEdit,
                icon: $graphics.editting,
                title: lang.editButton,
              ),
            ),
            PopupMenuItem<ItemState>(
              value: ItemState.delete,
              onTap: onDelete,
              child: DotItemWidget(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  color: $theme.whiteFFFFFF,
                ),
                title: lang.deleteButton,
              ),
            ),
          ],
          child: $graphics.dotsVertical,
        ),
      ),
    );
  }
}
