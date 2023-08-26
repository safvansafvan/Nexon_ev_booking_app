import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/controller/providers/map_provider/map_provider.dart';
import 'package:bookingapp/presentation/widgets/text_form_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewLocationWidget extends StatelessWidget {
  const AddNewLocationWidget(
      {super.key,
      required this.stationNameCtr,
      required this.screenSize,
      required this.descriptionCtr,
      required this.keyController,
      required this.lat,
      required this.long});

  final TextEditingController stationNameCtr;
  final Size screenSize;
  final TextEditingController descriptionCtr;
  final TextEditingController keyController;
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapProvider>(context, listen: false);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: radiusTen),
      title: const Text('Add Plot'),
      content: SizedBox(
        height: 220,
        child: ListView(children: [
          TextFormFieldCommon(
              controller: stationNameCtr,
              hintText: "Station",
              keyType: TextInputType.name,
              size: screenSize),
          CustomHeight.heightTen(context),
          TextFormFieldCommon(
              controller: descriptionCtr,
              hintText: "Desc",
              keyType: TextInputType.name,
              size: screenSize),
          CustomHeight.heightTen(context),
          Container(
            height: 63,
            decoration: BoxDecoration(
                border: Border.all(color: kblue), borderRadius: radiusTen),
            child: Center(
              child: CustomDropdown(
                  excludeSelected: true,
                  fillColor: Colors.transparent,
                  hintText: "Key",
                  hintStyle: TextStyle(color: kBlack),
                  selectedStyle: TextStyle(color: kBlack),
                  items: const ["KSEB", "Tata Motor", "Ather", "Other"],
                  controller: keyController),
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
            await mapProvider.addButtonClick(
                lat: lat, long: long, context: context);
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}
