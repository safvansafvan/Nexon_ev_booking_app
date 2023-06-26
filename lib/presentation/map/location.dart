import 'package:bookingapp/controller/providers/map_provider.dart';
import 'package:bookingapp/presentation/map/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<MapProvider>(context);

    return Stack(
      children: [
        FlutterMap(
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
          ],
        ),
        Positioned(
          bottom: 0,
          child: FloatingActionButton.small(
            onPressed: () {
              locationProvider.getCurrentLocation();
            },
            child: const Icon(Icons.gps_not_fixed_rounded),
          ),
        )
      ],
    );
  }
}
