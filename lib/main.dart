import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/global_error_handler.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();


}


// Future<void> initGetxServices() async{
//   debugPrint("starting services ...");
//   // await Get.putAsync(() => Service().init());
//  print('All services started...');
// }
