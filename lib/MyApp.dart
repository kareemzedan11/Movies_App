import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/cubit/auth&firestore_viewmodel.dart';
import 'package:movies_app/Presentation/layouts/auth/login/login_Viewmodel/login_view_model.dart';
import 'package:movies_app/Presentation/layouts/auth/login/login_screen.dart';
import 'package:movies_app/Presentation/layouts/auth/register/register_screen.dart';
import 'package:movies_app/Presentation/layouts/auth/register/register_viewmodel/register_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/home_screen.dart';
import 'package:movies_app/Presentation/layouts/movie_details/movie_details_screen.dart';
import 'package:movies_app/Presentation/layouts/movie_details/provider/trailler_provider.dart';
import 'package:movies_app/Presentation/layouts/series_details/series_details_screen.dart';
import 'package:movies_app/Presentation/layouts/splash/splach_screen.dart';
import 'package:movies_app/config/theme/Dark.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      routes: {
        Routes.homeRouteName: (context) => const HomeScreen(),
        Routes.splashRouteName: (context) => BlocProvider(
              create: (context) => AuthAndFirestoreViewmodel(),
              child: const splash(),
            ),
        Routes.loginRouteName: (context) => BlocProvider(
              create: (context) => getIt<LoginViewModel>(),
              child: const LoginScreen(),
            ),
        Routes.registerRouteName: (context) => BlocProvider(
              create: (context) => getIt<RegisterViewModel>(),
              child: const RegisterScreen(),
            ),
        Routes.movieDetailsScreenRouteName: (context) =>
            ChangeNotifierProvider(
              create: (context) => TraillerProvider(),
              child: const MovieDetailsScreen()),
        // Routes.categoryFilterRouteName: (context) =>
        //     const CategoryFilterScreen(),
        Routes.seriesDetailsScreen: (context) => ChangeNotifierProvider(
          create: (context) => TraillerProvider(),
          child: const SeriesDetailsScreen()),
      },
      initialRoute: Routes.splashRouteName,
      debugShowCheckedModeBanner: false,
      theme: DarkTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
