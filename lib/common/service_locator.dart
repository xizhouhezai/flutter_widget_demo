import 'package:get_it/get_it.dart';

import 'package:flutter_widget_demo/common/global_navigator.dart';

final GetIt getIt = GetIt.instance;

void setupLocator(){
  getIt.registerSingleton(NavigateService());
}