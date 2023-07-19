import 'package:bookingapp/controller/const/const.dart';
import 'package:bookingapp/presentation/widget/text_h.dart';
import 'package:flutter/material.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  kWidth,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HeadingTextWidget(
                      text: "Booking Status ",
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                      underline: true,
                      textSize: 17,
                    ),
                  ),
                ],
              ),
              commonHeight,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: screenSize.height * 00.37,
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: radiusTen),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edition: Nexon Ev',
                              style: textStyleFuc(
                                  weight: FontWeight.bold,
                                  color: kBlack,
                                  size: 18),
                            ),
                            Text(
                              'Name:Safvan',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'Email:Safvan@gmail.com',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'Phone:8968799687',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'State:Kerala',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'City:Malappuram',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'Address:Kondotty',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'Address:Kizisherri',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'Dealer:Fadilu',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Text(
                              'Date:06/06/2023',
                              style: textStyleFuc(
                                  weight: FontWeight.w500,
                                  color: kBlack,
                                  size: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount:5000',
                                  style: textStyleFuc(
                                      weight: FontWeight.bold,
                                      color: kBlack,
                                      size: 15),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 100,
                                  child: Card(
                                    elevation: 5,
                                    color: kGreen,
                                    child: Center(
                                      child: Text(
                                        'Success',
                                        style: textStyleFuc(
                                            weight: FontWeight.w500,
                                            color: kBlack,
                                            size: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
