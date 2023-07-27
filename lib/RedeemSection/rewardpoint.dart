import 'package:flutter/material.dart';
import 'package:hayaka/RedeemSection/transaction.dart';

class Rewardpoint extends StatefulWidget {
  const Rewardpoint({Key? key}) : super(key: key);

  @override
  _RewardpointState createState() => _RewardpointState();
}

class _RewardpointState extends State<Rewardpoint> {
  final List<Map> coupon = [
    {
      "name": "Mc Donalds",
      "image": "asset/mcdSet2.png",
      "expired": "10/2/2023",
      "description": "50% off discount on set meal",
      "point": "70"
    },
    {
      "name": "KFC",
      "image": "asset/kfcSet1.jpeg",
      "expired": "20/3/2023",
      "description": "60% off discount on set meal",
      "point": "80"
    },
    {
      "name": "Pizza Hut",
      "image": "asset/pizza1.jpeg",
      "expired": "19/4/2023",
      "description": "10% off discount on set meal",
      "point": "90"
    },
  ];
  final List<Map> gift = [
    {
      "name": "Mc Donalds",
      "image": "asset/mcdSet1.jpeg",
      "expired": "10/2/2023",
      "description": "50% off discount on set meal",
      "point": "70"
    },
    {
      "name": "KFC",
      "image": "asset/kfcSet1.jpeg",
      "expired": "20/3/2023",
      "description": "60% off discount on set meal",
      "point": "80"
    },
    {
      "name": "Pizza Hut",
      "image": "asset/pizza1.jpeg",
      "expired": "19/4/2023",
      "description": "10% off discount on set meal",
      "point": "90"
    },
  ];
  final List<Map> cash = [
    {
      "name": "Mc Donalds",
      "image": "asset/mcdSet1.jpeg",
      "expired": "10/2/2023",
      "description": "50% off discount on set meal",
      "point": "70"
    },
    {
      "name": "KFC",
      "image": "asset/kfcSet1.jpeg",
      "expired": "20/3/2023",
      "description": "60% off discount on set meal",
      "point": "80"
    },
    {
      "name": "Pizza Hut",
      "image": "asset/pizza1.jpeg",
      "expired": "19/4/2023",
      "description": "10% off discount on set meal",
      "point": "90"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reward Point"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back when the button is pressed
            },
          ),
        ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/green.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
      SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Container(
                width: 460,
                height: 143,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Text(
                          'Reward Points: 100',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment(0, 0),
                      child: TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              "Coupons",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Gifts",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Cash",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                  child: ListView.builder(
                                      itemCount: coupon.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 10, 10, 10),
                                            child: Container(
                                                width: 513,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  color:
                                                      Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Image.asset(
                                                              coupon[index]
                                                                  ['image'],
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                  height: 20),
                                                              Text(
                                                                coupon[index]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                  coupon[index][
                                                                      'description'],
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              Text(
                                                                  '${coupon[index]['point']} points',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              Text(
                                                                  'Use before ${coupon[index]['expired']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  const SizedBox(
                                                                      width:
                                                                          100),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Transaction()),
                                                                      );
                                                                    },
                                                                    child: const Text(
                                                                        "Redeem"),
                                                                  ),
                                                                ],
                                                              )
                                                            ]),
                                                      ],
                                                    ),
                                                  ],
                                                )));
                                      })),
                            ],
                          ),
                          Column(
  mainAxisSize: MainAxisSize.max,
  children: [
    Flexible(
      child: ListView.builder(
        itemCount: gift.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Card(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        gift[index]['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gift[index]['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            gift[index]['description'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${gift[index]['point']} points',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Use before ${gift[index]['expired']}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Transaction(),
                          ),
                        );
                      },
                      child: const Text("Redeem"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  ],
),


                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                  child: ListView.builder(
                                      itemCount: cash.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 10, 10, 10),
                                            child: Container(
                                                width: 513,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  color:
                                                      Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Image.asset(
                                                              cash[index]
                                                                  ['image'],
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                  height: 20),
                                                              Text(
                                                                cash[index]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                  cash[index][
                                                                      'description'],
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              Text(
                                                                  '${cash[index]['point']} points',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              Text(
                                                                  'Use before ${coupon[index]['expired']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  const SizedBox(
                                                                      width:
                                                                          100),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Transaction()),
                                                                      );
                                                                    },
                                                                    child: const Text(
                                                                        "Redeem"),
                                                                  ),
                                                                ],
                                                              )
                                                            ]),
                                                      ],
                                                    ),
                                                  ],
                                                )));
                                      })),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}