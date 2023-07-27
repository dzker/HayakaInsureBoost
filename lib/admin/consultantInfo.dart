import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayaka/admin/reviewConsultant.dart';

class ConsultantInfo extends StatefulWidget {
  const ConsultantInfo({Key? key}) : super(key: key);

  @override
  _ConsultantInfoState createState() => _ConsultantInfoState();
}

class _ConsultantInfoState extends State<ConsultantInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultant information"),
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 435,
                      height: 69,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Name: ',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Ali',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 83,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Status: ',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Not Assigned',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 25),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ReviewConsultant(), // Navigate to ReviewConsultant page
                                  ),
                                );
                              },
                              child: Text('Assign'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Phone No:',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              ' 014-33369990',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Email:',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              ' ali@yahoo.com',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Date of Birth:',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              ' 12/12/2000',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Address:',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              ' Malaysia',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'City:',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      width: 435,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 60, 75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Block'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('View Log'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
