import 'dart:async';
import 'package:helpme/module/home/model/home_model.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helpme/route/route.dart';
import 'package:helpme/route/route_constant.dart';
import 'package:hive/hive.dart';

import 'module/home/model/recent_search_model.dart';

void main() async {
  runApp(const MyApp());
  var localDirectory = await pathProvider.getApplicationDocumentsDirectory();
  //init hive
  Hive.init(localDirectory.path);
  Hive.registerAdapter(RecentSearchAdapter());
  Hive.registerAdapter(ResultAdapter());
  Hive.registerAdapter(GeometryAdapter());
  Hive.registerAdapter(LocationAdapter());
  Hive.registerAdapter(ViewportAdapter());
  Hive.registerAdapter(OpeningHoursAdapter());
  Hive.registerAdapter(PhotoAdapter());
  Hive.registerAdapter(PlusCodeAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoute.all,
      initialRoute: RouteConstant.home,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
