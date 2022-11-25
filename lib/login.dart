import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/home.dart';
import 'package:login_page/main.dart';
import 'package:login_page/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: Text(
                        'username password does not match',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('Data Empty');
                        }
                        //checkLogin(context);
                      },
                      icon: Icon(Icons.check),
                      label: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username and password matched');
      //go to home

      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      print('');

      //snackbar
      final _errorMessage = 'username and password does not match';

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        content: Text(_errorMessage),
        duration: Duration(seconds: 3),
      ));
    }

    // showDialog(
    //     context: ctx,
    //     builder: (ctx1) {
    //       return AlertDialog(
    //         title: Text('error'),
    //         content: Text(_errorMessage),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 Navigator.of(ctx1).pop();
    //               },
    //               child: Text('close'))
    //         ],
    //       );
    //     });
  }
}




      

      // //alert dialog

      

      // //show text

      // setState(() {
      //   _isDataMatched = false;
      // });