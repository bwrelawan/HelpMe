import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helpme/module/home/model/home_model.dart';
import 'package:helpme/module/home/home_service.dart';
import 'package:helpme/module/home/model/recent_search_model.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with HomeService {
  LatLng? currentPosition;
  Timer? debounce;
  GoogleMapController? googleMapController;
  List<Result> listPlace = [];
  late Box<RecentSearch> boxRecent;
  String _recentBox = 'recentSearch';
  List listRecent = <RecentSearch>[];

  bool isFirst = false;
  bool isLoadingPlace = false;
  bool isTextFieldTap = false;

  String userTypeChoice = "restaurant";
  String? keywordUser;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.rawSnackbar(
        message: 'Location services are disabled. Please enable the services',
        borderRadius: 20,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.rawSnackbar(
          message: 'Location permissions are denied',
          borderRadius: 20,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.rawSnackbar(
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
        borderRadius: 20,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );

      return false;
    }
    return true;
  }

  @override
  void onInit() {
    getCurrentPositionUser();

    super.onInit();
  }

  getPlace({String? keyword, String? typeArea}) async {
    listPlace = [];
    isLoadingPlace = true;
    keywordUser = keyword ?? "";
    update();
    final res = await getNearbyPlace(
        lat: currentPosition!.latitude,
        long: currentPosition!.longitude,
        typeArea: typeArea ?? "",
        keyword: keyword ?? userTypeChoice);
    listPlace.addAll(res);

    isLoadingPlace = false;
    await addRecentSearch(RecentSearch(keywordUser ?? "", listPlace));
    update();
  }

  Future<void> getCurrentPositionUser() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = LatLng(position.latitude, position.longitude);
      _refreshCameraPosition();
      getPlace(typeArea: userTypeChoice);
      update();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  onCameraMove(CameraPosition cameraPosition) async {
    update();
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      currentPosition = LatLng(
          cameraPosition.target.latitude, cameraPosition.target.longitude);
      if (isFirst) getPlace(keyword: keywordUser, typeArea: userTypeChoice);
      isFirst = true;
      update();
    });
  }

  onSearchLocation(String keyword) async {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      if (keyword.isNotEmpty) {
        if (keyword.length >= 3) {
          getPlace(keyword: keyword, typeArea: userTypeChoice);
        }
      } else {
        keywordUser = "";
      }
    });
  }

  chooseType(String typeArea) async {
    userTypeChoice = typeArea;
    getPlace(keyword: keywordUser ?? userTypeChoice, typeArea: typeArea);
    update();
  }

  void _refreshCameraPosition() {
    if (googleMapController != null) {
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosition!, zoom: 15),
      ));
      update();
    }
  }

  onTapSearch() {
    isTextFieldTap = true;
    update();
  }

  //save to local data
  getItem() async {
    boxRecent = await Hive.openBox<RecentSearch>(_recentBox);
    listRecent = boxRecent.values.toList().reversed.toList();

    update();
  }

  addRecentSearch(RecentSearch item) async {
    final box = await Hive.openBox<RecentSearch>(_recentBox);

    for (int i = 0; i < box.values.length; i++) {
      if (box.getAt(i)!.results.toString() == item.results.toString()) {
        box.deleteAt(i);
      }
    }
    box.add(item);

    getItem();

    update();
  }

  deleteRecentSearch(int index) {
    final box = Hive.box<RecentSearch>(_recentBox);
    int newIndex = box.values.length - (1 + index);
    box.deleteAt(newIndex);

    getItem();
    update();
  }

  Future<void> launchMaps(double lat, double lon) async {
    var url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
