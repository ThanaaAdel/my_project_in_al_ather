import 'package:animate_do/animate_do.dart';
import '../../../../../core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import 'my_orders_grid_view.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({
    super.key,
    required this.locale,
  });

  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(locale.translate('my_orders')!,
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
          ZoomIn(
              duration: const Duration(seconds: 1),
              child: const MyOrdersGridView()),
        ],
      ),
    );
  }
}
