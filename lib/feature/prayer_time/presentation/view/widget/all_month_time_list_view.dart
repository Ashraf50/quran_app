import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:quran_app/feature/prayer_time/presentation/view_model/cubit/get_all_pray_time_cubit.dart';
import 'package:quran_app/feature/prayer_time/presentation/view/widget/all_month_widget.dart';

class AllMonthTimeListView extends StatelessWidget {
  const AllMonthTimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SizedBox(
      height: 80,
      child: BlocBuilder<GetAllPrayTimeCubit, GetAllPrayTimeState>(
        builder: (context, state) {
          if (state is GetAllPrayTimeSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.time.length,
              itemBuilder: (context, index) {
                DateTime today = DateTime.now();
                String formattedDay = DateFormat('dd-MM-yyyy').format(today);
                var date = state.time[index].date!.gregorian!.date;
                if (formattedDay == date) {
                  return AllMonthWidget(
                    color: themeProvider.isDarkTheme
                        ? AppColors.primaryColor
                        : const Color(0xffF4E8F6),
                    pray: state.time[index],
                  );
                } else {
                  return AllMonthWidget(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
