import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexonev/controller/providers/group_provider/get_all_group_provider.dart';
import 'package:provider/provider.dart';
import '../../../../controller/core/constant.dart';
import '../../../widgets/text_h.dart';
import 'more_pop.dart';

ColoredBox appBarCommunity(BuildContext context) {
  return ColoredBox(
    color: kblue,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: kblue,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: kwhite)),
          title: HeadingTextWidget(
            text: " Groups",
            textSize: 19,
            color: kwhite,
            fontWeight: FontWeight.w600,
          ),
          actions: const [PopUp()],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CupertinoSearchTextField(
            backgroundColor: Colors.amber[50],
            onChanged: (value) {
              log('searching,$value');
              Provider.of<GetAllGroupsProvider>(context, listen: false)
                  .searchCommunity(value.trim());
            },
          ),
        ),
      ],
    ),
  );
}
