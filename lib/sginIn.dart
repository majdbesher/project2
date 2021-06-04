import 'package:flutter/material.dart';
//import 'package:http/http.dart'as http;
//import 'dart:convert';

class signinPage extends StatefulWidget {
  signinPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _signinPage createState() => _signinPage();
}

class _signinPage extends State<signinPage> {
//for display a massege error
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool ishidden = true;
  int _counter = 0;
  final TextEditingController _PhoneController = new TextEditingController();
  final TextEditingController _PasswordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
  void _send() {
    _formkey.currentState.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[50],
        body: Container(
            key: formkey,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  Image.asset('Icon\kk.jpg'),
                Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.cyan[800],
                      fontFamily: 'OpenSans',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),

                Padding(
                  padding: EdgeInsets.all(5.0),
                ),

                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "New Phone Number",
                      labelText: "Phone Number",
                      alignLabelWithHint: false,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.green[500],
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    controller: _PhoneController,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5.0),
                ),

                Container(
                  // margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: ishidden,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        labelText: "Password",
                        hintText: " Enter Your password",
                        alignLabelWithHint: false,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.green[500],
                        ),
                        suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              Icons.visibility,
                            ))),
                    controller: _PasswordController,
                  ),
                ),
                Container(
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    icon: Icon(Icons.create),
                    color: Colors.cyan,
                    highlightColor: Colors.lightGreen,
                    onPressed: () {
                      print('Is clicked');
                    },
                  ),
                ),
                Text('Forget Password ?'),

                Padding(padding: EdgeInsets.all(5.0)),
                ElevatedButton(
                  onPressed: () async {
                    /*print('button pressed');
                  String url = "http://10.0.2.2:8000/api/auth/login";
                  print('${_PhoneController.text}');
                  print('${_PasswordController.text}');
                  final res = await http.post(
                      url,
                      headers: {
                        'Accept': 'application/json',
                      },
                      body: {
                        "phone": "${_PhoneController.text}",
                        //"name": "maajd",
                        //"email": "maa@gmail.com",
                        "password": "${_PasswordController.text}",
                        //"phone":"0988319640"
                      }
                  );
                  print('body is ${res.body}');
                  var data = json.decode(res.body);
                  print('data ${data["name"]}');
                  print('data ${data["phone"]}');
                  print('data ${data["token"]}');*/
                    /*if (formkey.currentState.validate())
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('processing data')));
                  }*/
                  },
                  child: Text('Sign In'),
                )
              ],
            )));
  }

  void _togglePasswordView() {
    if (ishidden == true) {
      ishidden = false;
    } else
      ishidden = true;
    setState(() {});
  }
}
