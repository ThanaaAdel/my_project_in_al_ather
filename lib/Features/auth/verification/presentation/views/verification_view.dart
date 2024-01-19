import 'package:animate_do/animate_do.dart';
import 'widgets/verification_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInDown(child: const VerificationViewBody()),
    );
  }
}
