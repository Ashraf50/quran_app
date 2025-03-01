import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/loading_shimmer.dart';
import 'package:quran_app/feature/prayer_time/presentation/view_model/cubit/get_all_pray_time_cubit.dart';
import 'package:quran_app/feature/prayer_time/presentation/view/widget/pray_time_widget.dart';

class PrayTimeListView extends StatelessWidget {
  const PrayTimeListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPrayTimeCubit, GetAllPrayTimeState>(
      builder: (context, state) {
        if (state is GetAllPrayTimeSuccess) {
          return ListView.builder(
            itemCount: state.time.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              DateTime today = DateTime.now();
              String formattedDay = DateFormat('dd-MM-yyyy').format(today);
              var date = state.time[index].date!.gregorian!.date;
              if (formattedDay == date) {
                return PrayTimeWidget(
                  color: const Color(0xff1e9bd3),
                  pray: state.time[index],
                );
              } else {
                return PrayTimeWidget(
                  pray: state.time[index],
                );
              }
            },
          );
        } else if (state is GetAllPrayTimeFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
