import 'package:get_it/get_it.dart';
import 'package:mozz/src/common/service_provider.dart';
import 'package:mozz/src/features/chat/chat_service_provider.dart';
import 'package:mozz/src/features/home/home_service_provider.dart';
import 'package:mozz/src/utils/http/api.dart';
import 'package:mozz/src/utils/http/api_dio_impl.dart';

const services = <ServiceProvider>[
  ChatServiceProvider(),
  HomeServiceProvider(),
];


Future<void> init() async {
  for (var provider in services) {
    provider.register();
  }

  GetIt.instance.registerLazySingleton<Api>(() => ApiDioImpl());

  return GetIt.instance.allReady();
}
