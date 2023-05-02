import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/view/screens/splash_screen.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';
import 'package:news_app/view_model/network/dio-helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>NewsCubit()..getGeneral()..getSports()..getArts()..getBusiness()..getHealth()..getScience()..getTechnology())
    ], child:
    ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
    return
    MaterialApp(home: SplashScreen(),);}),);
  }
}
