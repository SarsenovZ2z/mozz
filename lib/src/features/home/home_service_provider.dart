import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mozz/src/common/service_provider.dart';
import 'package:mozz/src/features/home/presentation/pages/home_screen.dart';

class HomeServiceProvider extends ServiceProvider {
  const HomeServiceProvider();

  @override
  List getRoutes() {
    return [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: HomeScreen(
            key: state.pageKey,
          ),
        ),
      ),
    ];
  }

  @override
  void registerBlocs() {
    //
  }

  @override
  void registerDataSources() {
    //
  }

  @override
  void registerRepositories() {
    //
  }

  @override
  void registerUseCases() {
    //
  }
}
