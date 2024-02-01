import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/feature/splash/presentation/view/splash_view.dart';

class LottieLogo extends StatefulWidget {
  const LottieLogo({super.key});

  @override
  State<LottieLogo> createState() => _LottieLogoState();
}

class _LottieLogoState extends State<LottieLogo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SplashView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        'assets/img/logo.json',
        height: 250,
      )),
    );
  }
}
