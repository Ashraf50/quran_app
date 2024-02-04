import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/shimmer.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: ListView.builder(
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ShimmerLoading(width: 200, height: 100),
          );
        },
      ),
    );
  }
}
