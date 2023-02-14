import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oren/app/application.dart';

import 'app/core/global_error_handler.dart';
import 'app/feature_a/di/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await configureDependencies();

  GlobalErrorHandler(
    child: const Application()
  );
}


// Future<void> initGetxServices() async{
//   debugPrint("starting services ...");
//   // await Get.putAsync(() => Service().init());
//  print('All services started...');
// }
