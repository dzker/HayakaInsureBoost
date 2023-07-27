import 'package:flutter/material.dart';

import 'consultantInfo.dart';

class ConsultantList extends StatefulWidget {
  const ConsultantList({Key? key}) : super(key: key);

  @override
  _ConsultantListState createState() =>
      _ConsultantListState();
}

class _ConsultantListState
    extends State<ConsultantList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultant List"),
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
          ),SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              for (int i = 0; i < 1; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Container(
                    width: 485,
                    height: 152,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 60, 75),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 7, 0, 0),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name: Ali',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                const Text(
                                  'Date: 25/06/2023',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      'Not Assigned',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ConsultantInfo()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 0, 24, 0),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'View',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}