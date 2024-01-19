import 'package:flutter/material.dart';

import '../../../core/locale/app_localizations.dart';
import 'order_list_tile.dart';

class CurrentTap extends StatelessWidget {
  const CurrentTap({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
        OrderListTile(
          dotColor: Colors.amber,
          status: locale.translate('work_is_underway')!,
        ),
      ],
    );
  }
}
