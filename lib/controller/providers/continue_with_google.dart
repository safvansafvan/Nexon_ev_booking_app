// import 'package:bookingapp/apiservice/api.dart';
// import 'package:bookingapp/apiservice/status.dart';
// import 'package:bookingapp/controller/const/string.dart';
// import 'package:bookingapp/model/authentication/continue_with_google.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ContinueWithGoogleProvider extends ChangeNotifier {
    
//     GoogleSignIn? _googleSignIn ;


    


//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   setLoading(bool isLoading) {
//     _isLoading = isLoading;
//     notifyListeners();
//   }

//   getContinueWithGoogleStatus(context) async {
//      final url = Urls.baseUrl + Urls.continueWithGoogle;   
//     final response = ApiServices.postMethod(url: url, context: context,);
//     if (response is Success) {


//     }
//     if (response is Failures) {}
//     setLoading(false);
//   }
 
//   Map<String,dynamic>otpBody(){
    
//    final body={
//     "email":className.get.
//    };
      
   
//   }


//    setLoginStatus({
//     required String accessToken,
//     required String userId,
//     required String userName,
//     required String userEmail,
//   }) async {
//     final status = await SharedPreferences.getInstance();
//     await status.setBool("isLoggedIn", true);
//     await status.setString("ACCESS_TOKEN", accessToken);
//     await status.setString("USER_ID", userId);
//     await status.setString("USER_NAME", userName);
//     await status.setString("USER_EMAIL", userEmail);
//   }
// }


// // class ClassName {
// //   get()async{

   
// //   }
// // }