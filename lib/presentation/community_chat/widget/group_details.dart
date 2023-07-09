import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupDetailsWidget extends StatelessWidget {
  const GroupDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(168, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                  ),
                  height10,
                  Text("Group name",
                      style: textStyleFuc(
                          weight: FontWeight.w500, color: kwhite, size: 15)),
                  height10,
                  Text("Group Members:10",
                      style: textStyleFuc(
                          weight: FontWeight.w500, color: kwhite, size: 14)),
                  height10,
                ],
              ),
            )
          ],
        ));
  }
}
