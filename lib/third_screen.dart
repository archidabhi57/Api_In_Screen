import 'package:api_in_screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:api_in_screen/second_screen.dart';

class Third_Screen extends StatefulWidget {
  var image;
  var city;
  var location;
  var rating;
  var price;

  Third_Screen(
      {
        required this.image,
        required this.city,
        required this.location,
        required this.rating,
        required this.price,
      }
      );

  @override
  State<Third_Screen> createState() => _Third_ScreenState();
}

class _Third_ScreenState extends State<Third_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(widget.image,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 15, 0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: (
                                  Image.asset('assets/images/maps.png',
                                  )
                              ),
                            ),
                            Text('Maps',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/guide.png'),
                            ),
                            Text('Guide',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/sun and moon.jpg'),
                            ),
                            Text('Day & Night',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                              ),
                            ),
                          ],
                        ),

                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 20, 0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/dinner.jpg'),
                            ),
                            Text('Dinner',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(widget.city,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(widget.rating,
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                color: Colors.grey,
                              ),
                              Text(widget.location,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,
                                color: Colors.orange,
                              ),
                              Text('Map Direction',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                //alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'The Rolle Pass is a high mountain pass in Trentino in Italy.It connects the Fiemme and Primiero valleys, and the communities of Predezzo,San Martino di',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.deepOrange
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white,
                      child: Text(
                        widget.price,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 13
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Second_Screen();
                          },
                        ));
                      },
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.deepOrange.shade500,
                      child: Text("Book Now",
                        style: TextStyle(
                            fontSize: 13
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return First_Screen();
                          },
                        ));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}