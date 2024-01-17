import 'package:flutter/material.dart';
import 'package:mozz/src/common/presentation/widgets/shimmer.dart';
import 'package:mozz/src/router.dart';
import 'package:mozz/src/themes/light_theme.dart';
import 'package:mozz/src/themes/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        theme: themeData(lightTheme()),
      ),
    );
  }
}
