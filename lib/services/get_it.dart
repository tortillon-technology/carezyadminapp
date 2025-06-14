import 'package:get_it/get_it.dart';

import '../data/local/local_base_services.dart';
import '../data/local/sembast_services.dart';
import '../data/remote/network_base_services.dart';
import '../data/remote/network_services.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<LocalBaseServices>(() => SembastServices());
  getIt.registerLazySingleton<NetWorkBaseServices>(() => NetworkServices());
}

Future<void> initiliazeObjects() async {
  await getIt.get<LocalBaseServices>().initialize();
}
