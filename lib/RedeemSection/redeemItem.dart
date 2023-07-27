import 'package:flutter/material.dart';

class RedeemItem extends StatefulWidget {
  const RedeemItem({Key? key}) : super(key: key);

  @override
  _RedeemedItemState createState() => _RedeemedItemState();
}

class _RedeemedItemState extends State<RedeemItem> {
  final List<Map> item = [
    {
      "name": "Car",
      "image": "asset/bmw.jpg",
      "date": "23/6/2023",
      "status": "Delivering"
    },
    {
      "name": "SBK",
      "image": "asset/panigale.jpg",
      "date": "24/6/2023",
      "status": "Delivered"
    },
    {
      "name": "Phone",
      "image": "asset/phone.jpeg",
      "date": "25/6/2023",
      "status": "Delivered"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redeemed Item"),
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
            Flexible(
                child: ListView.builder(
                    itemCount: item.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: Container(
                              width: 513,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            item[index]['image'],
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item[index]['name'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                'Status: ${item[index]['status']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                            Text(item[index]['date'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                          ]),
                                    ],
                                  ),
                                ],
                              )));
                    })),
          ],
        ),
      ),
        ],
      ),
    );
  }
}