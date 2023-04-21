import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helpme/module/home/home_controller.dart';
import 'package:helpme/module/home/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController homeController) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              // appBar: AppBar(
              //   title: Column(
              //     children: [
              //       Text(homeController.currentPosition?.latitude.toString() ??
              //           ""),
              //       Text(homeController.currentPosition?.longitude.toString() ??
              //           ""),
              //     ],
              //   ),
              // ),
              body: Stack(
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    compassEnabled: false,
                    mapToolbarEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            homeController.currentPosition?.latitude ?? 0,
                            homeController.currentPosition?.longitude ?? 0),
                        zoom: 15),
                    onMapCreated: (controller) {
                      homeController.googleMapController = controller;
                    },
                    onCameraMove: (cameraPosition) {
                      homeController.onCameraMove(cameraPosition);
                    },
                  ),
                  Positioned(
                    right: 10,
                    top: 180,
                    child: Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            child: Text("Restaurant"),
                            onPressed: () {
                              homeController.chooseType("restaurant");
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  homeController.userTypeChoice == 'restaurant'
                                      ? Colors.blueAccent
                                      : Colors.blueGrey,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            child: Text("Hospital"),
                            onPressed: () {
                              homeController.chooseType("hospital");
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  homeController.userTypeChoice == 'hospital'
                                      ? Colors.blueAccent
                                      : Colors.blueGrey,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Card(
                        child: TextField(
                          onTap: () {
                            homeController.onTapSearch();
                          },
                          onChanged: (value) {
                            homeController.onSearchLocation(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Search Location",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                            ),
                          ),
                        ),
                      ),
                      homeController.isTextFieldTap
                          ? Container(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.listRecent.length,
                                itemBuilder: (_, i) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int j = 0;
                                          j <
                                              homeController
                                                  .listRecent[i].results.length;
                                          j++)
                                        InkWell(
                                          onTap: () {
                                            homeController.launchMaps(
                                              homeController
                                                      .listRecent[i]
                                                      .results[j]
                                                      .geometry
                                                      ?.location
                                                      ?.lat ??
                                                  0,
                                              homeController
                                                      .listRecent[i]
                                                      .results[j]
                                                      .geometry
                                                      ?.location
                                                      ?.lng ??
                                                  0,
                                            );
                                          },
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                homeController.listRecent[i]
                                                        .results[j].name ??
                                                    "",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: homeController.isLoadingPlace
                          ? Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.listPlace.length,
                                itemBuilder: (_, i) {
                                  return PlaceCard(
                                    place: homeController.listPlace[i],
                                    onTap: () {
                                      homeController.launchMaps(
                                        homeController.listPlace[i].geometry
                                                ?.location?.lat ??
                                            0,
                                        homeController.listPlace[i].geometry
                                                ?.location?.lng ??
                                            0,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
