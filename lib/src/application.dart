import 'package:flutter/material.dart';
import 'package:mozz/src/common/presentation/widgets/shimmer.dart';
import 'package:mozz/src/features/home/presentation/pages/home_screen_placeholder.dart';
import 'package:mozz/src/themes/light_theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        theme: lightTheme,
        home: const HomeScreenPlaceholder(),
      ),
    );
  }
}
