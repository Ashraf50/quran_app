import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/Home/data/repos/home_repo_impl.dart';
import 'package:quran_app/feature/Home/presentation/view_model/cubit/get_all_quran_cubit.dart';
import 'package:quran_app/feature/splash/presentation/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool storedValue = pref.getBool('boolValue') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkTheme: storedValue),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllQuranCubit(
            HomeRepoImpl(
              ApiServices(Dio()),
            ),
          )..fetchAllQuran(),
        ),
      ],
      child: GetMaterialApp(
        theme: themeProvider.getThemeData,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
//edition