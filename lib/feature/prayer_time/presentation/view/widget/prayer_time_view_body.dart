import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/prayer_time/presentation/view/widget/all_month_time_list_view.dart';
import 'package:quran_app/feature/prayer_time/presentation/view/widget/prayer_time_widget.dart';

import '../../../../../core/widget/custom_scaffold.dart';

class PrayerTimeViewBody extends StatelessWidget {
  const PrayerTimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDay = DateFormat('dd MMM yyyy').format(today);
    return CustomScaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            title: "Prayer Timing",
            actions: [
              IconButton(
                onPressed: () {
                  context.push('/all_month_pray');
                },
                icon: Icon(Icons.calendar_month),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 10),
            child: Text(
              formattedDay,
              style: Styles.textStyle19,
            ),
          ),
          const AllMonthTimeListView(),
          const PrayerTimeWidget(),
        ],
      ),
    );
  }
}
