import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/news_cubit/news_cubit.dart';
import 'package:news_app/Repository/news_repository.dart';
import 'package:news_app/Screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(NewsRepository()),
        ),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,  // Add this line
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
