import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/repos/repo_impl.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/HadithPage/data/cubit/get_all_hadith_cubit.dart';
import 'package:quran_app/feature/HadithPage/presentation/view/widget/hadith_widget.dart';

class HadithListView extends StatelessWidget {
  const HadithListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllHadithCubit(HomeRepoImpl(ApiServices(Dio())))
        ..fetchAllHadiths(),
      child: BlocBuilder<GetAllHadithCubit, GetAllHadithState>(
        builder: (context, state) {
          if (state is GetAllHadithSuccess) {
            return ListView.builder(
              itemCount: state.hadiths.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return HadithWidget(
                  hadith: state.hadiths[index],
                );
              },
            );
          } else if (state is GetAllHadithFailure) {
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
  }
}
