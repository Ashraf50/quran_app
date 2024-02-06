import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content.dart';
import 'package:quran_app/feature/Details/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';

class SurahContentListView extends StatelessWidget {
  final QuranModel quran;
  const SurahContentListView({
    super.key,
    required this.quran,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahBookmarksCubit, SurahBookmarksState>(
      builder: (context, state) {
        var cubit = SurahBookmarksCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quran.array!.length,
            itemBuilder: (context, index) {
              return SurahContent(
                surah: quran.array![index],
                onPressed: () {
                  if (cubit.isSelected(quran.array![index])) {
                    cubit.delete(quran.array![index]);
                    showSnackBar(
                      context,
                      "Ayah removed from your Bookmarks",
                      Icons.check_circle,
                    );
                  } else {
                    cubit.add(quran.array![index]);
                    showSnackBar(
                      context,
                      "Ayah added to your Bookmarks",
                      Icons.bookmark,
                    );
                  }
                },
                icon: Icon(
                  cubit.isSelected(quran.array![index])
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: secondColor,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
