import 'package:go_router/go_router.dart';
import 'package:quran_app/feature/AzkarPage/data/model/azkar_model/azkar_model.dart';
import 'package:quran_app/core/widget/bottom_bar.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';
import 'package:quran_app/feature/Home/presentation/view/details_view.dart';
import 'package:quran_app/feature/radio/presentation/view/radio_details_view.dart';
import 'package:quran_app/feature/search/presentation/view/search_view.dart';
import 'package:quran_app/feature/splash/presentation/view/splash_view.dart';
import '../../feature/AzkarPage/presentation/view/widget/azkar_content_view.dart';
import '../../feature/menu.dart/presentation/view/widget/book_marks/azkar_bookmarks_list_view.dart';
import '../../feature/menu.dart/presentation/view/widget/book_marks/book_marks.dart';
import '../../feature/menu.dart/presentation/view/widget/book_marks/surah_bookmarks_list_view.dart';
import '../../feature/prayer_time/presentation/view/widget/all_month_pray_time_view.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/splash_view',
    routes: [
      GoRoute(
        path: '/splash_view',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/surah_bookmarks',
        builder: (context, state) => const SurahBookmarksListView(),
      ),
      GoRoute(
        path: '/azkar_bookmarks',
        builder: (context, state) => const AzkarBookmarksListView(),
      ),
      GoRoute(
        path: '/bookmarks',
        builder: (context, state) => const BookMarksListView(),
      ),
      GoRoute(
        path: '/all_month_pray',
        builder: (context, state) => const AllMonthPrayTimeView(),
      ),
      GoRoute(
        path: '/bottom_bar',
        builder: (context, state) => const BottomBar(),
      ),
      GoRoute(
          path: '/search_view',
          builder: (context, state) {
            final quran = state.extra as List<QuranModel>;
            return SearchView(
              quran: quran,
            );
          }),
      GoRoute(
          path: '/details_view',
          builder: (context, state) {
            final surah = state.extra as QuranModel;
            return DetailsView(
              surah: surah,
            );
          }),
      GoRoute(
          path: '/radio_details',
          builder: (context, state) {
            final surah = state.extra as int;
            return RadioDetailsView(
              surahNum: surah,
            );
          }),
      GoRoute(
          path: '/azkar_view',
          builder: (context, state) {
            final azkar = state.extra as AzkarModel;
            return AzkarContentView(
              azkar: azkar,
            );
          }),
    ],
  );
}
