import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_config/features/custom_themes/presenter/cubit/custom_theme_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final CustomThemeCubit _customThemeCubit;
  @override
  void initState() {
    super.initState();

    _customThemeCubit = context.read<CustomThemeCubit>()..getThemes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeCubit, CustomThemeState>(
      bloc: _customThemeCubit,
      builder: (context, state) {
        return switch (state) {
          CustomThemeInitial() => const SizedBox.shrink(),
          CustomThemeLoading() => const CircularProgressIndicator(),
          CustomThemeError() => const Text('error'),
          CustomThemeSuccess() => Scaffold(
              drawer: Drawer(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: Text(widget.title),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Expanded(
                          child: Column(
                        children: [],
                      )),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                              foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.secondary,
                              ),
                              fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.sizeOf(context).width, 20),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(''
                                // state.customThemesEntity.customThemes[1].id.toString(),
                                ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.secondary),
                              foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                              fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.sizeOf(context).width, 20),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Continue'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        };
      },
    );
  }
}
