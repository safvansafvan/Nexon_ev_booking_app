import 'dart:developer';

import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/map_provider.dart';
import 'package:bookingapp/presentation/map/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<dynamic>? mapDetails;

  MapController mapController = MapController();
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    final locationProvider = Provider.of<MapProvider>(context, listen: false);
    _getCurrentLocation(locationProvider);
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<MapProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: MapConst.myLocation,
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
                  if (mapDetails != null)
                    for (var detail in mapDetails!)
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
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: kBlack,
                ),
              ),
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
      throw Exception('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw Exception(
            'Location permissions are denied (actual value: $permission).');
      }
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
    mapDetails = await locationProvider.getChargingProt();

    log(mapDetails.toString());
  }
}
