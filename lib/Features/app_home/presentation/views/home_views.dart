import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/hex_color.dart';
import 'widgets/home_screen_body.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#D3D1EF"),
        body: FadeInUp(child: const HomeScreenBody()),
      ),
    );
  }
}
