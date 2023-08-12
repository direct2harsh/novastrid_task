import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_form/bloc/upload_bloc.dart';
import 'package:upload_form/upload_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NovaStrid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ContentSwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ContentFileBloc(),
        )
      ], child: const UploadScreen()),
    );
  }
}
