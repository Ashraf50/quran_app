import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/repos/repo_impl.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/Details/data/cubit/get_all_ayahs_cubit.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content.dart';

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
      child: BlocProvider(
        create: (context) => GetAllAyahsCubit(HomeRepoImpl(ApiServices(Dio())))
          ..fetchAllAyah(surahNumber: surahNumber),
        child: BlocBuilder<GetAllAyahsCubit, GetAllAyahsState>(
          builder: (context, state) {
            if (state is GetAllAyahsSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.ayahs.length,
                itemBuilder: (context, index) {
                  return SurahContent(ayah: state.ayahs[index]);
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
      ),
    );
  }
}
