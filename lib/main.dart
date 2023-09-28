import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_config/features/custom_themes/domain/usecases/custom_theme_usecase.dart';
import 'package:remote_config/features/custom_themes/presenter/cubit/custom_theme_cubit.dart';
import 'package:remote_config/firebase_options.dart';
import 'package:remote_config/core/injects/injection.dart';
import 'package:remote_config/core/instance_get_it/instance_get_it.dart';

import 'features/custom_themes/presenter/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Injection.inject(getIt);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Config',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider<CustomThemeCubit>(
        create: (context) => CustomThemeCubit(
          customThemeUsecase: getIt.get<CustomThemeUsecase>(),
        ),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
