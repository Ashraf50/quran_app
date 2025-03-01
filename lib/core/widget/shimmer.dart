import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Shimmer.fromColors(
      baseColor: themeProvider.isDarkTheme
          ? const Color(0xff1D2233)
          : const Color.fromARGB(116, 158, 158, 158),
      highlightColor: themeProvider.isDarkTheme
          ? const Color.fromARGB(61, 54, 63, 92)
          : Color.fromARGB(125, 158, 158, 158),
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Color(0xff1D2233),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
