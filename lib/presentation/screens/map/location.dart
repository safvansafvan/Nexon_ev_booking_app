import 'dart:developer';
import 'package:bookingapp/presentation/screens/map/widget/add_new_location.dart';
import 'package:bookingapp/presentation/screens/map/widget/location_pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/map_provider/map_provider.dart';
import 'package:bookingapp/presentation/screens/map/constent/constent.dart';
import 'package:bookingapp/presentation/screens/map/widget/more.dart';
import 'package:bookingapp/presentation/widgets/snack_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController mapController = MapController();
  PageController pageController = PageController();
  Position? currentPosition;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddNewLocationWidget(
                        stationNameCtr: locationProvider.stationNameCtr,
                        screenSize: screenSize,
                        descriptionCtr: locationProvider.descriptionCtr,
                        keyController: locationProvider.keyController,
                        lat: point.latitude,
                        long: point.longitude);
                  },
                );
              },
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: currentLocation ?? const LatLng(10.1632, 76.6413),
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
                  for (var detail in locationProvider.mapDetails)
                    if (detail.type == 'Others')
                      Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(
                          detail.lat as double,
                          detail.long as double,
                        ),
                        builder: (ctx) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => LocationPopup(
                                name: detail.title.toString(),
                                description: detail.desc.toString(),
                                type: detail.type.toString(),
                                date: detail.createdAt.toString(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            child: Icon(
                              Icons.location_pin,
                              color: Color.fromARGB(200, 87, 102, 100),
                            ),
                          ),
                        ),
                      ),
                  for (var detail in locationProvider.mapDetails)
                    if (detail.type == 'KSEB')
                      Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(
                          detail.lat as double,
                          detail.long as double,
                        ),
                        builder: (ctx) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => LocationPopup(
                                name: detail.title.toString(),
                                description: detail.desc.toString(),
                                type: detail.type.toString(),
                                date: detail.createdAt.toString(),
                              ),
                            );
                          },
                          child: SizedBox(
                            child: Icon(Icons.location_pin, color: kred),
                          ),
                        ),
                      ),
                  for (var detail in locationProvider.mapDetails)
                    if (detail.type == 'Tata')
                      Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(
                          detail.lat as double,
                          detail.long as double,
                        ),
                        builder: (ctx) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => LocationPopup(
                                name: detail.title.toString(),
                                description: detail.desc.toString(),
                                type: detail.type.toString(),
                                date: detail.createdAt.toString(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            child: Icon(Icons.location_pin,
                                color: Color.fromARGB(255, 26, 90, 217)),
                          ),
                        ),
                      ),
                  for (var detail in locationProvider.mapDetails)
                    if (detail.type == 'Others')
                      Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(
                          detail.lat as double,
                          detail.long as double,
                        ),
                        builder: (ctx) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => LocationPopup(
                                name: detail.title.toString(),
                                description: detail.desc.toString(),
                                type: detail.type.toString(),
                                date: detail.createdAt.toString(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            child: Icon(Icons.location_pin,
                                color: Color.fromARGB(255, 11, 185, 168)),
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
                borderRadius: BorderRadius.circular(6),
                backgroundColor: Colors.white,
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
                _getCurrentLocation();
              },
              child: Icon(
                Icons.gps_fixed_sharp,
                color: kblue,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      return snackBarWidget(
          context: context, title: "Please Enable Location Service", clr: kred);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      // ignore: use_build_context_synchronously
      return snackBarWidget(
          context: context, title: "Permission denied", clr: kred);
    }
    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously
      return snackBarWidget(
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
