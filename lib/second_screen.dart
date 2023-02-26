library dart.js;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api_in_screen/third_screen.dart';
import 'package:http/http.dart' as http;

class Second_Screen extends StatefulWidget {
  const Second_Screen({Key? key}) : super(key: key);

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  int selectedIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          body: FutureBuilder<http.Response>(
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.hasData) {

                return Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 5),
                                    child: Expanded(
                                      child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgZBXkEgzvue7q9Y_7oRIMh7qaWLSQeFl-T082L3qFVoXnkoqXlekT0X95JtEuFPOp7MQ&usqp=CAU')),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Welcome Back👋',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Container(
                                              child: Text(
                                                'Ronald Richards',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.orange[200],
                                        child: Icon(
                                          Icons.notifications_none_outlined,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(children: [
                                Row(children: [
                                  Flexible(
                                    child: Container(
                                      child: TextField(
                                        cursorColor: Colors.grey,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                borderSide: BorderSide.none),
                                            hintText: 'Discovery a city',
                                            hintStyle:
                                            TextStyle(color: Colors.grey,
                                                fontSize: 18),
                                            prefixIcon: Container(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.search,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            suffixIcon: Container(
                                              child: Icon(Icons.list_rounded),
                                            )),
                                      ),
                                    ),
                                  ),
                                ]),
                              ])),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 90,
                        child: ListView.builder(
                          itemCount:
                          jsonDecode(snapshot.data!.body.toString()).length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              elevation: 3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(13),
                                              child: Image.network(
                                                (jsonDecode(snapshot.data!.body
                                                    .toString())[index]
                                                ['Image1']).toString(),
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            (jsonDecode(snapshot.data!.body
                                                .toString())[index]['Place'])
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'NotoSansAdlamUnjoined',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Explore Cities',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        fontFamily: 'NotoSansAdlamUnjoined'),
                                  ),
                                ),
                                Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Name('All'),
                                        Name('Popular'),
                                        Name('Recommended'),
                                        Name('Most Viewed'),
                                        Name('Records')
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 270,
                        child: ListView.builder(
                          itemCount: jsonDecode(snapshot.data!.body.toString())
                              .length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return Third_Screen(
                                      image: (jsonDecode((snapshot
                                          .data!.body)
                                      .toString())[
                                  index]['Image']).toString(),
                                      city: (jsonDecode((snapshot
                                          .data!.body)
                                      .toString())[
                                  index]['City']),
                                      location: (jsonDecode((snapshot
                                      .data!.body)
                                      .toString())[
                                  index]['Location']),
                                      rating: (jsonDecode((snapshot
                                      .data!.body)
                                      .toString())[
                                  index]['Rating']),
                                      price: (jsonDecode((snapshot
                                      .data!.body)
                                      .toString())[
                                  index]['Price']));
                                },));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 230,
                                  width: 200,
                                  child: Card(
                                    shape:
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            23)),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            //color: Colors.orange,
                                            // width: 325,
                                            height: 180,

                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(30),
                                              child: Image.network(
                                                (jsonDecode((snapshot
                                                    .data!.body)
                                                    .toString())[
                                                index]['Image']),
                                                fit: BoxFit.contain,
                                                alignment: Alignment.center,
                                                //width: 500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child: Container(
                                                                  child: Text(
                                                                    (jsonDecode(
                                                                        (snapshot
                                                                            .data!
                                                                            .body)
                                                                            .toString())[
                                                                    index]['City'])
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight
                                                                            .bold,
                                                                        fontFamily:
                                                                        'NotoSansAdlamUnjoined'),
                                                                  ),
                                                                )),
                                                            Container(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_border_outlined,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Center(
                                                                      child: Text(
                                                                        (jsonDecode(
                                                                            (snapshot
                                                                                .data!
                                                                                .body)
                                                                                .toString()
                                                                        )[
                                                                        index]['Rating'])
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontFamily: 'NotoSansAdlamUnjoined',
                                                                            color: Colors
                                                                                .grey),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                      )),
                                                  Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                child: Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        color: Colors
                                                                            .grey,
                                                                        size: 15,
                                                                      ),
                                                                      Text(
                                                                        (jsonDecode(
                                                                            (snapshot
                                                                                .data!
                                                                                .body)
                                                                                .toString())[
                                                                        index]['Location'])
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontSize: 10,
                                                                            fontFamily: 'NotoSansAdlamUnjoined',
                                                                            color: Colors
                                                                                .grey),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                child: Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                                  child: Text(
                                                                    "\$${(jsonDecode(
                                                                        (snapshot
                                                                            .data!
                                                                            .body)
                                                                            .toString()
                                                                    )[
                                                                    index]['Price'])
                                                                        .toString()}/Person",
                                                                    style: TextStyle(
                                                                        fontSize: 10,
                                                                        fontFamily: 'NotoSansAdlamUnjoined',
                                                                        color: Colors
                                                                            .orange),
                                                                  ),
                                                                )),

                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Popular Categories',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        fontFamily: 'NotoSansAdlamUnjoined'),
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(30)),
                                              child: Image.asset(
                                                'assets/images/aeroplane.png',
                                                width: 50,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'Flights',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(40)),
                                              child: Image.asset(
                                                'assets/images/hotel.jpg',
                                                width: 50,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'Hotels',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(50)),
                                              child: Image.asset(
                                                'assets/images/transport.jpg',
                                                width: 50,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'Transports',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(40)),
                                              child: Image.asset(
                                                'assets/images/events.jpg',
                                                width: 50,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'Events',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    //Expanded(child: Container(color: Colors.black45,)),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
            future: getData(context),
          ),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                currentIndex: selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      label: 'Home',
                      backgroundColor: Colors.deepOrange[100]),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.explore_outlined,
                      color: Colors.grey,
                    ),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.widgets_outlined,
                        color: Colors.grey,
                      ),
                      label: 'Widgets'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.grey,
                      ),
                      label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.grey,
                      ),
                      label: 'Profile'),
                ],
              ),
            ),
          ),
        ));
  }

  void showDelete(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
          Text("Alert!!!", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('Are You Sure Want To Delete This Record?',
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            TextButton(
                onPressed: () async {
                  http.Response res = await deleteData(id);
                  // if(isLoading){
                  if (res.statusCode == 200) {
                    setState(() {});
                  }


                  Navigator.of(context).pop();
                },
                child:
                Text('Yes', style: TextStyle(fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                Text('No', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        );
      },
    );
  }

  bool getBoolFromDynamic(data, index) {
    try {
      return jsonDecode(data.body.toString())[index]['IsFavourite'] as bool;
    } catch (e) {
      try {
        return jsonDecode(data.body.toString())[index]['IsFavourite']
            .toString()
            .toLowerCase() ==
            'true';
      } catch (e) {
        return false;
      }
    }
  }

  Future<http.Response> getData(context) async {
    var response = await http
        .get(Uri.parse('https://6310390036e6a2a04ee856d8.mockapi.io/Match'));
    return response;
  }

  Future<http.Response> deleteData(id) async {
    var response = await http.delete(
        Uri.parse('https://6310390036e6a2a04ee856d8.mockapi.io/Faculties/$id'));

    return response;
  }
}

Widget Name(ExploreCities) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(right: 8, left: 5),
      child: Card(elevation: 1, child: Text(ExploreCities)),
    ),
  );
}
