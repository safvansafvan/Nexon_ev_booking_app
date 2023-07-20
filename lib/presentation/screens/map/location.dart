import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingapp/presentation/widget/text_form_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:bookingapp/controller/core/core.dart';
import 'package:bookingapp/controller/providers/map_provider/map_provider.dart';
import 'package:bookingapp/presentation/screens/map/const.dart';
import 'package:bookingapp/presentation/screens/map/widget/more.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  MapController mapController = MapController();
  Position? currentPosition;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    final locationProvider = Provider.of<MapProvider>(context, listen: false);
    _getCurrentLocation(locationProvider);
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final locationProvider = Provider.of<MapProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              onLongPress: (tapPosition, point) {
                log("${point.latitude}");
                log("${point.longitude}");
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: radiusTen),
                      title: const Text('Add Plot'),
                      content: SizedBox(
                        height: 220,
                        child: Column(children: [
                          TextFormFieldCommon(
                              controller: locationProvider.stationNameCtr,
                              hintText: "Station",
                              keyType: TextInputType.name,
                              size: screenSize),
                          height10,
                          TextFormFieldCommon(
                              controller: locationProvider.descriptionCtr,
                              hintText: "Desc",
                              keyType: TextInputType.name,
                              size: screenSize),
                          height10,
                          Container(
                            height: 63,
                            decoration: BoxDecoration(
                                border: Border.all(color: kblue),
                                borderRadius: radiusTen),
                            child: Center(
                              child: CustomDropdown(
                                  excludeSelected: true,
                                  fillColor: Colors.transparent,
                                  hintText: "Key",
                                  hintStyle: TextStyle(color: kBlack),
                                  selectedStyle: TextStyle(color: kBlack),
                                  items: const [
                                    "KSEB",
                                    "Tata Motor",
                                    "Ather",
                                    "Other"
                                  ],
                                  controller: locationProvider.keyController),
                            ),
                          ),
                        ]),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        TextButton(
                          onPressed: () async {
                            log(locationProvider.stationNameCtr.text.toString(),
                                name: "station Name");
                            log(locationProvider.keyController.text.toString(),
                                name: "Key");
                            log(locationProvider.descriptionCtr.text.toString(),
                                name: "descr");
                            log(point.latitude.toString());
                            log(point.longitude.toString());
                            await locationProvider.addButtonClick(
                                context: context,
                                lat: point.latitude.toDouble(),
                                long: point.longitude.toDouble());
                          },
                          child: const Text("OK"),
                        )
                      ],
                    );
                  },
                );
              },
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: currentLocation ?? const LatLng(0, 0),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/safvansaf/cljcfcez4005401qk6k8f7ct2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FmdmFuc2FmIiwiYSI6ImNsamNod3h4NDAxYXYzZG1vczZkMWw5Zm8ifQ.yLccfVKgM5PQiSPtHC-cNw",
                additionalOptions: const {
                  'mapStyleId': MapConst.mapStyleId,
                  'accessToken': MapConst.mapBoxAccessToken,
                },
              ),
              MarkerLayer(
                markers: [
                  if (currentPosition != null)
                    Marker(
                      width: 100.0,
                      height: 100.0,
                      point: LatLng(currentPosition!.latitude,
                          currentPosition!.longitude),
                      builder: (ctx) => const SizedBox(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  if (currentLocation != null)
                    Marker(
                      width: 100.0,
                      height: 100.0,
                      point: LatLng(currentLocation!.latitude,
                          currentLocation!.longitude),
                      builder: (ctx) => const SizedBox(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  if (locationProvider.mapDetails != null)
                    for (var detail in locationProvider.mapDetails!)
                      if (detail['lat'] != null && detail['long'] != null)
                        Marker(
                          width: 100.0,
                          height: 100.0,
                          point: LatLng(
                            detail['lat'] as double,
                            detail['long'] as double,
                          ),
                          builder: (ctx) => const SizedBox(
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: ListTile(
              contentPadding: const EdgeInsets.all(1),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: kBlack,
                ),
              ),
              title: CupertinoSearchTextField(
                backgroundColor: Colors.grey[350],
                onChanged: (value) {
                  log(value);
                  searchPlace(value);
                },
              ),
              trailing: const PopUpMenuOption(),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: FloatingActionButton(
              onPressed: () {
                _getCurrentLocation(locationProvider);
              },
              child: const Icon(Icons.gps_not_fixed_rounded),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation(MapProvider locationProvider) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      return snakBarWiget(
          context: context, title: "Please Enable Location Service", clr: kred);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      // ignore: use_build_context_synchronously
      return snakBarWiget(
          context: context, title: "Permission denied", clr: kred);
    }
    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously
      return snakBarWiget(
          context: context,
          title: "Location permissions are permanently denied",
          clr: kred);
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
    mapController.move(
      LatLng(position.latitude, position.longitude),
      15.0,
    );
  }

  void searchPlace(String query) async {
    List<Location> locations = await locationFromAddress(query);
    if (locations.isNotEmpty) {
      Location location = locations.first;
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      if (placemarks.isNotEmpty) {
        LatLng searchedLocation = LatLng(
          location.latitude,
          location.longitude,
        );
        setState(() {
          currentLocation = searchedLocation;
          mapController.move(currentLocation!, 15.0);
        });
      }
    }
  }
}
