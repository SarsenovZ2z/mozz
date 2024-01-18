import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mozz/src/common/presentation/widgets/shimmer.dart';
import 'package:mozz/src/features/chat/presentation/controllers/chats_cubit.dart';
import 'package:mozz/src/router.dart';
import 'package:mozz/src/themes/light_theme.dart';
import 'package:mozz/src/themes/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatsCubit>(
          create: (_) => GetIt.instance()..load(const LoadChatsParams()),
        ),
      ],
      child: Shimmer(
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          theme: themeData(lightTheme()),
        ),
      ),
    );
  }
}
