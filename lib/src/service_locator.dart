import 'package:get_it/get_it.dart';
import 'package:mozz/src/common/service_provider.dart';
import 'package:mozz/src/features/chat/chat_service_provider.dart';
import 'package:mozz/src/features/home/home_service_provider.dart';

const services = <ServiceProvider>[
  HomeServiceProvider(),
  ChatServiceProvider(),
];


Future<void> init() async {
  for (var provider in services) {
    provider.register();
  }

  return GetIt.instance.allReady();
}
