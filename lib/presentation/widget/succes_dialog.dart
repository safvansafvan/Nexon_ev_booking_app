import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

void successDialogWiget(context, message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    showCloseIcon: true,
    animType: AnimType.BOTTOMSLIDE,
    title: "Success",
    desc: message,
    btnCancelText: "Cancel",
  ).show();
  const duration = Duration(seconds: 3);
  Future.delayed(duration, () {
    Navigator.of(context).pop();
  });
}
