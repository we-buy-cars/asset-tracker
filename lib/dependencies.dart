import 'package:asset_tracker/apis/apis.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt get di => GetIt.instance;

const String apiUrl = 'https://634d10b5acb391d34a92d314.mockapi.io/api/v1';

/// Register dependencies via GetIt. They can later be accessed anywhere in the application.
/// https://pub.dev/packages/get_it
Future<void> registerDependencies() async {
  // Example of providing a concrete implementation of an abstract class (interface).
  di.registerFactory<UserApi>(() => DioUserApi(baseUrl: apiUrl));
  // di.registerFactory<UserApi>(() => HttpUserApi(baseUrl: apiUrl));

  // Example of providing a singleton asynchronously.
  di.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());

  // You can also use the following methods to register dependencies based on your needs.
  // di.registerSingleton<UserApi>(DioUserApi(baseUrl: apiUrl));
  // di.registerFactoryAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());

  // Wait for all dependencies to be resolved before continuing.
  await di.allReady();
}
