// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (((context, index) {
                if (index == 0 || index % 2 == 0) {
                  return ListTile(
                    title: Text(
                      'Person ${index + 1}',
                      style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Message $index'),
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 247, 7, 7),
                      backgroundImage:
                          AssetImage('assets/images/large-movie7.jpg'),
                    ),
                    trailing: Text('${index + 1}:00 P.M'),
                  );
                } else {
                  return ListTile(
                    title: Text(
                      'Person ${index + 1}',
                      style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Message $index'),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        'assets/images/large-movie7.jpg',
                        width: 60,
                      ),
                    ),
                    trailing: Text('${index + 1}:00 P.M'),
                  );
                }
              })),
              separatorBuilder: ((context, index) {
                return Divider();
              }),
              itemCount: 12)),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
