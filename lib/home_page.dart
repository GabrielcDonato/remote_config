import 'package:flutter/material.dart';
import 'package:remote_config/firebase_remote_config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    CustomRemoteConfig().forceFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (CustomRemoteConfig().getValueOrDefault(
              key: 'server_off',
              defaultValue: true,
            )) ...[
              Text(
                'Servidor esta off',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
