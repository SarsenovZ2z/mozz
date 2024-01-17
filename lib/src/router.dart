import 'package:go_router/go_router.dart';
import 'package:mozz/src/service_locator.dart';

final router = GoRouter(
  routes: <RouteBase>[
    ...services
        .map((service) => List<RouteBase>.from(service.getRoutes()))
        .expand((element) => element),
  ],
);
