import 'order_list_tile.dart';
import '../../../core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

class RejectedTap extends StatelessWidget {
  const RejectedTap({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        OrderListTile(
          dotColor: Colors.red,
          status: locale.translate('reject')!,
        ),
        OrderListTile(
          dotColor: Colors.red,
          status: locale.translate('reject')!,
        ),
        OrderListTile(
          dotColor: Colors.red,
          status: locale.translate('reject')!,
        ),
        OrderListTile(
          dotColor: Colors.red,
          status: locale.translate('reject')!,
        ),
        OrderListTile(
          dotColor: Colors.red,
          status: locale.translate('reject')!,
        ),
      ],
    );
  }
}
