import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection() => getIt.init();

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio();
}
