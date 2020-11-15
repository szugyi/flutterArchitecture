import 'package:flutter_architecture/core/flavor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

const mock = Environment('mock');
const integration = Environment('integration');

@InjectableInit()
void configureDependencies(String env, FlavorConfig config) {
  GetIt.instance.registerSingleton<FlavorConfig>(config);

  $initGetIt(GetIt.instance, environment: env);
}
