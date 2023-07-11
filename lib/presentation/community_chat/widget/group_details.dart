import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/model/group_model.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

class GroupDetailsWidget extends StatelessWidget {
  const GroupDetailsWidget({super.key, required this.groupData});
  final Group? groupData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(168, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kwhite,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(168, 0, 0, 0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                ),
                height10,
                Text(
                  groupData!.groupName,
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 15),
                ),
                height10,
                Text(
                  "Members:${groupData!.members.length}",
                  style: textStyleFuc(
                      weight: FontWeight.w500, color: kwhite, size: 14),
                ),
                height10,
              ],
            ),
          ),
          kHeightFive,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                HeadingTextWidget(
                  text: "Members",
                  fontWeight: FontWeight.w600,
                  textSize: 16,
                  underline: true,
                ),
                height10,
                // ListView.builder(
                //   itemCount: groupData?.members.length ?? 0,
                //   itemBuilder: (context, index) {
                //     return Text(grou)
                //   },
                // )
                // for (var member in groupData!.members)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8),
                //     child: Text(
                //       member,
                //       style: textStyleFuc(
                //           weight: FontWeight.w600, color: kBlack, size: 15),
                //     ),
                //   ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
