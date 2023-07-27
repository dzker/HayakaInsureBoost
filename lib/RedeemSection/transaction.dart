import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final List<Map> item = [
    {
      "name": "Transaction 1",
      "image": "asset/hundred.jpg",
      'item': "cash RM100",
      "point": '50',
      "date": "23/6/2023",
      "status": "pending"
    },
    {
      "name": "Transaction 2",
      "image": "asset/twenty.jpg",
      'item': "cash RM 20",
      "point": '20',
      "date": "24/6/2023",
      "status": "approved"
    },
    {
      "name": "Transaction 3",
      "image": "asset/cash.jpeg",
      'item': "cash RM 50",
      "point": '30',
      "date": "25/6/2023",
      "status": "approved"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction"),
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
            child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(item[index]['point'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              Text(item[index]['item'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              Text(item[index]['date'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              Text(
                                                  'Status: ${item[index]['status']}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ]),
                                      ],
                                    ),
                                  ],
                                )));
                      })),
            ]))
        ],
      ),
            );
  }
}