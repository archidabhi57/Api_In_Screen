import 'package:api_in_screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/images/travelling girl.jpg',
                height: 800,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expolre Beauty\nOf Journey",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Everything you can imagine,is here",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: SlideAction(
                      sliderButtonIcon: const Icon(
                        color: Colors.white,
                        Icons.arrow_forward_ios,
                      ),
                      text: "Swipe to Explore Now",
                      textStyle: const TextStyle(color: Colors.white),
                      borderRadius: 20,
                      innerColor: Colors.black38,
                      outerColor: Colors.black12.withOpacity(0.2),
                      onSubmit: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              // return
                              return Second_Screen();
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
