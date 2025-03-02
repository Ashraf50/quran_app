import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/radio/data/repo/radio_repo_impl.dart';
import 'package:quran_app/feature/radio/presentation/view/widget/radio_details_view_body.dart';
import 'package:quran_app/feature/radio/presentation/view_model/cubit/get_radio_cubit.dart';

class RadioDetailsView extends StatelessWidget {
  final int surahNum;
  const RadioDetailsView({
    super.key,
    required this.surahNum,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRadioCubit(RadioRepoImpl())..fetchRadio(surahNum),
      child: BlocBuilder<GetRadioCubit, GetRadioState>(
        builder: (context, state) {
          if (state is GetRadioSuccess) {
            return RadioDetailsViewBody(
              radio: state.radio,
            );
          } else if (state is GetRadioFailure) {
            Center(
              child: Text(state.errMessage),
            );
          } else if (state is GetRadioLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
