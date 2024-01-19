import 'order_list_tile.dart';
import '../../../core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

class AcceptedTap extends StatelessWidget {
  const AcceptedTap({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        OrderListTile(
          dotColor: Colors.green,
          status: locale.translate('the_request_was_accepted')!,
        ),
        OrderListTile(
          dotColor: Colors.green,
          status: locale.translate('the_request_was_accepted')!,
        ),
        OrderListTile(
          dotColor: Colors.green,
          status: locale.translate('the_request_was_accepted')!,
        ),
        OrderListTile(
          dotColor: Colors.green,
          status: locale.translate('the_request_was_accepted')!,
        ),
        OrderListTile(
          dotColor: Colors.green,
          status: locale.translate('the_request_was_accepted')!,
        ),
      ],
    );
  }
}
