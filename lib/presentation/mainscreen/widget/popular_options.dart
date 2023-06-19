import 'package:bookingapp/controller/const/const.dart';
import 'package:flutter/material.dart';

class PopularOptionsWidges extends StatelessWidget {
  const PopularOptionsWidges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/chatBoat.jpg"),
                  ),
                  border: Border.all(color: Colors.grey),
                  borderRadius: radiusTen,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Chat Boat',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: kBlack),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/community.jpeg"),
                  ),
                  border: Border.all(color: Colors.grey),
                  borderRadius: radiusTen,
                ),
              ),
              kHeightFive,
              Text(
                'Community',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: kBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
