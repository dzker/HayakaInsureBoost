import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayaka/customer/global/global_variables.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hayaka/customer/models/user.dart';
import 'package:hayaka/customer/pages/home/home_page.dart';
import 'package:hayaka/customer/pages/reward_page.dart';
import 'package:hayaka/customer/pages/submit_form_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:hayaka/customer/pages/settings_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      // backgroundColor: Colors.white,
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      // backgroundColor: Colors.white,
      icon: Icon(Icons.widgets_rounded),
      label: 'Reward',
    ),
  ];

  late int currentIndex;

  late Person me = Person('', '', '', '', '', 0, '');

  final pages = [
    HomePage(),
    DashBoardPage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    getUser();
  }

  Future<void> getUser() async {
    // await FirebaseAuth.instance.signOut();
    int i = 0;
    bool error = true;
    while (i < 5) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get()
            .then((doc) {
          me = Person(FirebaseAuth.instance.currentUser!.uid, doc['username'],
              doc['email'], doc['profileUrl'], doc['bio'], doc['point'], doc['rool']);
        });
        error = false;
      } catch (e) {
        print(e);
        // initState();
        // await FirebaseAuth.instance.signOut();
        error = true;
      }
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
              backgroundColor: globals.NIGHT_MODE
                  ? globals.scaffoldDark
                  : globals.scaffoldLight,
              body: Center(
                child: SpinKitRing(
                  color: Colors.teal,
                  size: 80.0,
                ),
              ),
            );
          }

          // Check if me is null before proceeding
          if (me == null) {
            return Scaffold(
                // Handle the case where me is null.
                // For example, you can return a loading widget or an error message.
                );
          }
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: globals.NIGHT_MODE ? Colors.white : Colors.black,
              ),
              elevation: 0,
              backgroundColor:
                  globals.NIGHT_MODE ? globals.appBarDark : globals.appBarLight,
              title: Text(
                'Customer',
                style: TextStyle(
                  color: globals.NIGHT_MODE ? Colors.white : Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    // Navigate to the SettingsPage and wait for it to complete.
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );

                    // After the SettingsPage is popped from the stack, this code will be executed.
                    // Use setState here to update any changes made on the SettingsPage.
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.settings,
                    color: globals.NIGHT_MODE ? Colors.white : Colors.black,
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: globals.NIGHT_MODE
                  ? globals.scaffoldDark
                  : globals.scaffoldLight,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              items: bottomNavItems,
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                _changePage(index);
              },
            ),
            body: pages[currentIndex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: currentIndex == 0 ? Colors.teal : Colors.grey,
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubmitFormPage(),
                  ),
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            drawer: Drawer(
              backgroundColor:
                  globals.NIGHT_MODE ? globals.drawBgDark : globals.drawBgLight,
              //侧边栏按钮Drawer
              child: new ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    //Material内置控件
                    accountName: new Text(
                      me.username,
                      style: TextStyle(fontSize: 20),
                    ), //用户名
                    accountEmail: new Text(me.email), //用户邮箱
                    currentAccountPicture: new GestureDetector(

                      child: new CircleAvatar(
                        //圆形图标控件
                        backgroundImage:
                            new NetworkImage(me.profileUrl), //图片调取自网络
                      ),
                    ),
                    decoration: new BoxDecoration(color: Colors.teal),
                  ),
                  new ListTile(
                      title: new Text('Settings',
                          style: TextStyle(
                              color: globals.NIGHT_MODE
                                  ? Colors.grey[200]
                                  : Colors.grey[800])),
                      trailing: new Icon(Icons.settings,
                          color: globals.NIGHT_MODE
                              ? Colors.grey[200]
                              : Colors.grey[800]),
                      onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsPage()),
  );
},
),
                  new ListTile(
                      title: new Text('Share this App',
                          style: TextStyle(
                              color: globals.NIGHT_MODE
                                  ? Colors.grey[200]
                                  : Colors.grey[800])),
                      trailing: new Icon(Icons.share,
                          color: globals.NIGHT_MODE
                              ? Colors.grey[200]
                              : Colors.grey[800]),
                      onTap: () async {
                        final urlPreview =
                            'https://github.com/MaaZiJyun/Insurance-Boost/raw/main/installer/app-release.apk';
                        await Share.share(
                            'This is the link for download our app:\n\n$urlPreview');
                      }),
                ],
              ),
            ),
          );
        });
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  _getRequists() {
    setState(() {});
  }
}
