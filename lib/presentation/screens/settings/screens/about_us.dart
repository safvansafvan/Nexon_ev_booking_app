import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/widgets/app_bar.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            AppBarWidget(
              leading: Icons.arrow_back_ios_new_sharp,
              settings: true,
              menu: false,
              title: "About us",
            ),
            CustomHeight.commonHeightz(context),
            HeadingTextWidget(
              text: "About Us",
              color: kBlack,
              textSize: 20,
              fontWeight: FontWeight.w500,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "Welcome to Nexon ev booking app, a user-friendly mobile application designed to provide a seamless experience for all your automotive needs. Whether you're looking to book a test drive, rent a car, or connect with fellow enthusiasts, our app offers a range of features to enhance your automotive journey."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Our Features:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "1.Map: Our interactive map feature allows you to explore various locations, find nearby dealerships, service centers, and discover exciting automotive destinations."),
            CustomHeight.heightTen(context),
            const Text(
                "2.Test Drive Booking: Experience the thrill of test driving your dream car with ease. Our app lets you conveniently schedule test drives at your preferred dealership and explore different models before making a decision."),
            CustomHeight.heightTen(context),
            const Text(
                "3.Car Booking: Need a vehicle for a special occasion or an extended trip? Our car booking feature enables you to easily rent cars from trusted providers, offering a wide range of options to suit your preferences and requirements."),
            CustomHeight.heightTen(context),
            const Text(
                "4.Settings: Customize your app experience with our settings feature. Personalize notifications, language preferences, and other app-specific configurations to suit your needs."),
            CustomHeight.heightTen(context),
            const Text(
                "5.Chat Bot: Our intelligent chat bot is here to provide instant assistance and answer your queries. From general information to specific inquiries about our services, our chat bot ensures you have a seamless and efficient support experience."),
            CustomHeight.heightTen(context),
            const Text(
                "6.Community Chat: Connect with like-minded individuals in our vibrant community chat. Share experiences, seek advice, and engage in conversations with fellow automotive enthusiasts from around the world."),
            CustomHeight.heightTen(context),
            const Text(
                "7.Login, Signup, OTP, Forgot Password: Our secure user authentication system allows you to create an account, log in, and reset your password conveniently. Protecting your personal information is our top priority."),
            CustomHeight.heightTen(context),
            const Text(
                "8.Continue with Google: Sign up or log in to our app effortlessly using your existing Google account. Streamline the registration process and enjoy a seamless integration with your Google profile."),
            CustomHeight.heightTen(context),
            Text(
              "At Brototype, we are committed to providing a user-friendly and reliable platform for all your automotive needs. Our team works tirelessly to ensure that you have an exceptional experience while using our app.",
              style: textStyleFuc(
                  weight: FontWeight.w500, color: kBlack, size: 15),
            ),
            CustomHeight.heightTen(context),
            Text(
              "If you have any questions, feedback, or suggestions, we would love to hear from you. Please feel free to contact us at sajusajuptl@gmail.com. Thank you for choosing Nexon ev booking app!",
              style: textStyleFuc(
                  weight: FontWeight.w500, color: kBlack, size: 15),
            )
          ],
        ),
      ),
    );
  }
}
