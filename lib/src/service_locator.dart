import 'package:mozz/src/common/service_provider.dart';

const services = <ServiceProvider>[

];


Future<void> init() async {
  for (var provider in services) {
    provider.register();
  }
}
