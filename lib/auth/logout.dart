import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayaka/auth/login.dart'; // Replace with your login page file

class LogoutPage extends StatelessWidget {
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _logout().then((_) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()), // Replace with your login page
                (route) => false,
              );
            });
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
