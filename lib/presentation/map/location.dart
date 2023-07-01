import 'dart:developer';
import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/controller/providers/map_provider.dart';
import 'package:bookingapp/presentation/map/const.dart';
import 'package:bookingapp/presentation/map/more.dart';
import 'package:bookingapp/presentation/widget/snack_bar.dart';
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
    // ignore: use_build_context_synchronously
    mapDetails = await locationProvider.getChargingProt(context);

    log(mapDetails.toString());
  }
}
