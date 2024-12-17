import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/MyApp.dart';
import 'package:movies_app/Presentation/cubit/bloc_observer.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_feature/view_model/search_view_model.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/Presentation/layouts/provider/home_provider.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  ApiManger.init();
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          )
        ],
        child: BlocProvider(
          create: (context) => getIt<SearchTabViewModel>(),
          child: const MyApp(),
        ),
      ),
    ),
  );
}
