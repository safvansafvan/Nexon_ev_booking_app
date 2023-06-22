import 'package:awesome_dialog/awesome_dialog.dart';

void successDialogWiget(context, message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    showCloseIcon: true,
    animType: AnimType.BOTTOMSLIDE,
    title: "Success",
    desc: message,
    btnCancelText: "Cancel",
    // btnCancelOnPress: () {
    //   Navigator.of(context).pop();
    // },
  ).show();
}
