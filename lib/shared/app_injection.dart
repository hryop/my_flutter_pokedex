
import '../core/utils/injections.dart';
import 'data/data_source/app_shared_prefs.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}