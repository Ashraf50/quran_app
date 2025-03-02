import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_content.dart';
import 'package:quran_app/feature/Home/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';
import '../../../data/model/quran_model/ayahs.dart';

class SurahContentListView extends StatelessWidget {
  final List<Ayahs> ayahs;
  const SurahContentListView({
    super.key,
    required this.ayahs,
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
              itemCount: ayahs.length,
              itemBuilder: (context, index) {
                return SurahContent(
                  ayah: ayahs[index],
                  onPressed: () {
                    if (cubit.isSelected(ayahs[index])) {
                      cubit.delete(ayahs[index]);
                      showSnackBar(
                        context,
                        "Ayah removed from your Bookmarks",
                        Icons.check_circle,
                      );
                    } else {
                      cubit.add(ayahs[index]);
                      showSnackBar(
                        context,
                        "Ayah added to your Bookmarks",
                        Icons.bookmark,
                      );
                    }
                  },
                  icon: Icon(
                    cubit.isSelected(ayahs[index])
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: AppColors.primaryColor,
                  ),
                );
              },
            ));
      },
    );
  }
}
