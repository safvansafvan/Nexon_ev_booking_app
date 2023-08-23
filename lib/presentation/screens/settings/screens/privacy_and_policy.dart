import 'package:bookingapp/controller/core/constant.dart';
import 'package:bookingapp/presentation/widgets/app_bar.dart';
import 'package:bookingapp/presentation/widgets/text_h.dart';
import 'package:flutter/material.dart';

class PrivacyAndPolicyWidget extends StatelessWidget {
  const PrivacyAndPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            AppBarWidget(
              leading: Icons.arrow_back_ios_new_rounded,
              settings: true,
              menu: false,
              title: "Privacy&Policy",
            ),
            CustomHeight.commonHeightz(context),
            HeadingTextWidget(
              text: "Nexon Ev Booking App",
              color: kBlack,
              textSize: 20,
              fontWeight: FontWeight.w500,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "This Privacy Policy explains how Brototype collects, uses, and safeguards your personal information when you use the Nexon ev booking app mobile application application. By using the App, you consent to the data practices described in this Policy."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Information We conllect:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "1.1. Personal Information: When you use the App, we may collect personal information such as your name, email address, phone number, and other information you provide during the signup or account creation process.\n1.2. Usage Information: We may collect information about your interactions with the App, including your activity logs, preferences, and settings.\n1.3. Device Information: We may collect information about your mobile device, such as the device model, operating system, unique device identifiers, and mobile network information."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Use of Collected Information:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "2.1. We may use the collected information to provide and personalize the App's features and services, including but not limited to map services, test drive bookings, car bookings, settings customization, chat bot assistance, community chat, and user authentication.\n2.2. We may use your contact information to communicate with you, respond to your inquiries, and provide relevant information about our services, updates, and promotions.\n2.3. We may use the collected information for internal purposes such as analyzing usage patterns, improving the App's functionality and performance, and enhancing user experience."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Information Sharing and Disclosure:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "3.1. We may share your personal information with trusted third-party service providers who assist us in operating and maintaining the App. These service providers are obligated to protect your information and may only use it for the purposes specified by us.\n3.2. We may disclose your information to comply with legal obligations, enforce our policies, respond to legal requests, or protect our rights, property, or safety, or the rights, property, or safety of others.\n3.3. In the event of a merger, acquisition, or sale of all or a portion of our assets, your information may be transferred to the acquiring entity."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Data Security:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "4.1. We implement appropriate technical and organizational measures to safeguard your personal information and protect it against unauthorized access, alteration, disclosure, or destruction.\n4.2. Despite our efforts to secure the data, no method of transmission or storage is completely secure. Therefore, we cannot guarantee the absolute security of your information."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Third Party Link Service:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "5.1. The App may contain links to third-party websites, services, or advertisements that are not controlled or owned by us. This Policy does not apply to such third-party practices, and we are not responsible for the privacy practices or content of those entities. We encourage you to review the privacy policies of those third parties."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Changes to this Policy:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text(
                "6.1. We reserve the right to modify or update this Policy at any time. Any changes to this Policy will be posted on this page with the updated date. It is your responsibility to review this Policy periodically for any updates."),
            CustomHeight.heightTen(context),
            HeadingTextWidget(
              text: "Contact Us:",
              color: kBlack,
              textSize: 16,
              underline: true,
            ),
            CustomHeight.heightTen(context),
            const Text("sajusajuptl@gmail.com")
          ],
        ),
      ),
    );
  }
}
