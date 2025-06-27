import 'package:carezyadminapp/src/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../data/local/local_base_services.dart';
import '../data/local/sembast_services.dart';
import '../data/remote/network_base_services.dart';
import '../data/remote/network_services.dart';
import '../src/auth/repo/auth_repo_implements.dart';
import '../src/customer/repo/customer_repo.dart';
import '../src/customer/repo/customer_repo_implements.dart';
import '../src/services/repo/service_repo.dart';
import '../src/services/repo/service_repo_implements.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<LocalBaseServices>(() => SembastServices());
  getIt.registerLazySingleton<NetWorkBaseServices>(() => NetworkServices());
  getIt.registerFactory<AuthRepo>(() => AuthRepoImplements());
  getIt.registerFactory<ServiceRepo>(() => ServiceRepoImplements());
  getIt.registerFactory<CustomerRepo>(() => CustomerRepoImplements());
}

Future<void> initiliazeObjects() async {
  await getIt.get<LocalBaseServices>().initialize();
}
