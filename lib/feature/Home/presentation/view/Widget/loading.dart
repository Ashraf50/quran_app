import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: ShimmerLoading(width: 200, height: 60),
          );
        },
      ),
    );
  }
}
