import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast%20laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/main_page/screan_main_page.dart';

import 'application/search/search_bloc.dart';
import 'domain/core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastLaughBloc>()),
        // create: (context) => SubjectBloc(),
      ],

      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "flutter demo",
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent),
              fontFamily: GoogleFonts
                  .montserrat()
                  .fontFamily,
              scaffoldBackgroundColor: backgroundColor,
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(color: Colors.white),
                  bodyMedium: TextStyle(color: Colors.white)),
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                  .copyWith(background: Colors.black)),
          home: ScreenMainPage()),
    );
  }
}

