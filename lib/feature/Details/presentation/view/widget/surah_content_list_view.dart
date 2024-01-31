import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/repos/repo_impl.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/Details/data/cubit/get_all_ayahs_cubit.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content.dart';
import 'package:quran_app/feature/menu.dart/data/cubit/book_marks_cubit.dart';

class SurahContentListView extends StatelessWidget {
  final int surahNumber;
  const SurahContentListView({
    super.key,
    required this.surahNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<BookMarksCubit, BookMarksState>(
        builder: (context, state) {
          var cubit = BookMarksCubit.get(context);
          return BlocProvider(
            create: (context) =>
                GetAllAyahsCubit(HomeRepoImpl(ApiServices(Dio())))
                  ..fetchAllAyah(surahNumber: surahNumber),
            child: BlocBuilder<GetAllAyahsCubit, GetAllAyahsState>(
              builder: (context, state) {
                if (state is GetAllAyahsSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.ayahs.length,
                    itemBuilder: (context, index) {
                      return SurahContent(
                        ayah: state.ayahs[index],
                        onPressed: () {
                          if (cubit.isSelected(state.ayahs[index])) {
                            cubit.delete(state.ayahs[index]);
                          } else {
                            cubit.add(state.ayahs[index]);
                          }
                        },
                        icon: Icon(
                          cubit.isSelected(state.ayahs[index])
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: secondColor,
                        ),
                      );
                    },
                  );
                } else if (state is GetAllAyahsFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
