import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WarningMessage extends StatelessWidget {
  const WarningMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/img/no_data.json',
        height: 300,
      ),
    );
  }
}
