import 'package:flutter/material.dart';
import 'package:plantapp/controller/plantcontroller.dart';
import 'package:plantapp/pages/homepage.dart';
import 'package:plantapp/style/textstyle.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController();
  List splashImage = [
    'assets/images/plant8.png',
    'assets/images/plant3.png',
    'assets/images/plant5.png'
  ];
  List<String> textDescriptions = [
    'Discover the Beauty of',
    'Explore the World of',
    'Embrace  Green',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(body: Consumer<ScreenProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return PageView.builder(
                itemCount: splashImage.length,
                controller: controller,
                onPageChanged: (change) {
                  value.pageIndex = change;
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        splashImage[index],
                        height: 250,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (dot) => Container(
                                  margin: const EdgeInsets.all(2),
                                  width: value.pageIndex == dot ? 12 : 5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: value.pageIndex == dot
                                          ? const Color.fromRGBO(
                                              118, 152, 75, 1)
                                          : Colors.grey),
                                )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 170,
                        child: Wrap(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: textDescriptions[value.pageIndex],
                                style: appstyle(
                                    color: Colors.black,
                                    size: 23,
                                    ff: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text: ' Plants',
                                    style: appstyle(
                                        color: Colors.black,
                                        size: 23,
                                        ff: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          },
        )),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Container(
                color: const Color.fromRGBO(118, 152, 75, 1),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Homepage();
                      }));
                    },
                    icon: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
