import 'package:flutter/material.dart';
import 'package:nexonev/controller/core/constant.dart';
import 'package:nexonev/presentation/screens/brochure/pdfview/pdf_view.dart';

class BrochureGridViewWidget extends StatelessWidget {
  const BrochureGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color myHexColor = const Color.fromARGB(255, 0, 89, 101);
    List pdfImages = [
      "assets/broumax.jpg",
      "assets/brouprime4.jpg",
      "assets/broucdark.jpg"
    ];
    List carNames = ["Nexon Ev Prime", "Nexon Ev Max", "Nexon Prime Black"];
    return Scaffold(
      backgroundColor: myHexColor,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kwhite,
                  )),
              title: Text(
                "Brochure",
                style: textStyleFuc(
                    weight: FontWeight.w500, color: kwhite, size: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PdfViewScreen(pdf: "assets/nprime.pdf"),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PdfViewScreen(
                                pdf: "assets/Nexonprimebrou.pdf"),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PdfViewScreen(
                                pdf: "assets/Nexon-EV-bro.pdf"),
                          ),
                        );
                      }
                    },
                    child: GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: radiusTen,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(pdfImages[index]),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            carNames[index],
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
