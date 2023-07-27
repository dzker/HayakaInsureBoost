import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hayaka/admin/banner.dart';
import 'package:hayaka/consultant/consultantCustList.dart';
import 'package:hayaka/consultant/consultantDashboard.dart';
import 'package:hayaka/auth/register.dart';
import 'package:hayaka/auth/login.dart';
import 'package:hayaka/RedeemSection/redeemItem.dart';
import 'package:hayaka/RedeemSection/rewardpoint.dart';
import 'package:hayaka/RedeemSection/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


