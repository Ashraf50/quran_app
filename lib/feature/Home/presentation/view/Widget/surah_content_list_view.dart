import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/Home/data/repo/home_repo_impl.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_content.dart';
import 'package:quran_app/feature/Home/presentation/view_model/cubit/fetch_surah_cubit.dart';
import 'package:quran_app/feature/Home/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';

class SurahContentListView extends StatelessWidget {
  final int surahNum;
  const SurahContentListView({
    super.key,
    required this.surahNum,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahBookmarksCubit, SurahBookmarksState>(
      builder: (context, state) {
        var cubit = SurahBookmarksCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocProvider(
            create: (context) => FetchSurahCubit(HomeRepoImpl())
              ..fetchSurahContent(surahNumber: surahNum),
            child: BlocBuilder<FetchSurahCubit, FetchSurahState>(
                builder: (context, state) {
              if (state is FetchSurahContentSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.surah.ayahs!.length,
                  itemBuilder: (context, index) {
                    return SurahContent(
                      ayah: state.surah.ayahs![index],
                      onPressed: () {
                        if (cubit.isSelected(state.surah.ayahs![index])) {
                          cubit.delete(state.surah.ayahs![index]);
                          showSnackBar(
                            context,
                            "Ayah removed from your Bookmarks",
                            Icons.check_circle,
                          );
                        } else {
                          cubit.add(state.surah.ayahs![index]);
                          showSnackBar(
                            context,
                            "Ayah added to your Bookmarks",
                            Icons.bookmark,
                          );
                        }
                      },
                      icon: Icon(
                        cubit.isSelected(state.surah.ayahs![index])
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: secondColor,
                      ),
                    );
                  },
                );
              } else if (state is FetchSurahContentLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchSurahContentFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else {
                return SizedBox();
              }
            }),
          ),
        );
      },
    );
  }
}
