import 'package:flutter/material.dart';
import 'package:hayaka/RedeemSection/redeemItem.dart';
import 'package:hayaka/RedeemSection/rewardpoint.dart';
import 'package:hayaka/RedeemSection/transaction.dart';
import 'package:hayaka/consultant/element.dart';
import 'consultantCustList.dart';
import 'package:hayaka/auth/logout.dart';

class ConsultantDashboard extends StatefulWidget {
  const ConsultantDashboard({super.key});

  @override
  State<ConsultantDashboard> createState() => _ConsultantDashboardState();
}

class _ConsultantDashboardState extends State<ConsultantDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultant"),
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
            child: Column(
              children: [
                SizedBox(height: 20),
                // Row containing the GridView
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 20.0,
                        ),
                        itemCount: elements.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              if (elements[index].name == "Redeem Reward Point") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Rewardpoint(),
                                  ),
                                );
                              }else if (elements[index].name == "Redeemed Item") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RedeemItem(),
                                  ),
                                );
                              }else if (elements[index].name == "Customer List") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => consultantCustList(),
                                  ),
                                );
                              }else if (elements[index].name == "Redeem Transaction") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Transaction(),
                                  ),
                                );
                              } 
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(150, 2, 60, 75), // Add some transparency to the background color
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  elements[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // Custom text made by HAYAKA
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Made by HAYAKA',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              // Logout Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogoutPage(), // Replace LogoutPage with your actual logout page widget
                      ),
                    );
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
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