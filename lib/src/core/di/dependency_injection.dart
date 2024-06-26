import 'package:get_it/get_it.dart';
import 'package:new_streamline/src/app/data/data_sources/local/fake/fake_order_datasource.dart';
import 'package:new_streamline/src/app/domain/repositories/order_repository.dart';
import 'package:new_streamline/src/extra/shared_pref/shared_pref_manager.dart';

abstract class DependencyInjection {
  static final _getIt = GetIt.instance;

  // init.
  static Future<void> init() async {
    // prepare shared pref manager.
    final SharedPrefManager sharedPrefManager = await SharedPrefManager.init();

    ///////////////////////////////// register dependencies /////////////////////////////////////////////////
    /////////
    _getIt.registerLazySingleton<SharedPrefManager>(() => sharedPrefManager);
    /////////
    _getIt.registerLazySingleton<OrderRepository>(
        () => OrderRepository(fakeOrderDatasource: FakeOrderDatasource()));
    /////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
  }

  // get.
  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
