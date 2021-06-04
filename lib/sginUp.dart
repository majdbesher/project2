import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class signupPage extends StatefulWidget {
  signupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _signupPage createState() => _signupPage();
}

class _signupPage extends State<signupPage> {
//for display a massege error
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  int id = 1;
  bool visible = false;
  String _value = " الجامعة السورية الخاصة  ";
  String radioButtonItem =
      'one'; //Default Radio button selected Item when App Started
  bool checkBoxValue = false;
  bool ishidden = true;
  bool dropdownVisible = false;
  bool buttonVisible = false;
  int _counter = 0;
  final TextEditingController _NameController = new TextEditingController();
  final TextEditingController _IdController = new TextEditingController();
  final TextEditingController _PhoneController = new TextEditingController();
  final TextEditingController _PasswordController = new TextEditingController();
  String type = 'normal';
  String university_name = " الجامعة السورية الخاصة  ";

  final _formkey = GlobalKey<FormState>();
  void _send() {
    _formkey.currentState.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          leading: Icon(Icons.account_circle_rounded),
          title: Text('Create an account'),
        ),
        backgroundColor: Colors.purple[50],
        body: Container(
            key: formkey,
            padding: EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Image.asset('Icon\kk.jpg'),
              Padding(padding: EdgeInsets.all(15.0)),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: "الاسم",
                      hintText: "ادخل اسمك الكامل",
                      alignLabelWithHint: false,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.purple[400],
                      )),
                  controller: _NameController,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: "ادخل الرقم الخاص بك ",
                    labelText: " رقم الهاتف",
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.purple[400],
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  controller: _PhoneController,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: " ادخل الرقم الوطني ",
                    labelText: "الرقم الوطني",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purple[400],
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  controller: _IdController,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Container(
                // margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: ishidden,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: "كلمة المرور",
                      hintText: " ادخل كلمة المرور",
                      alignLabelWithHint: false,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.purple[400],
                      ),
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            Icons.visibility,
                          ))),
                  controller: _PasswordController,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Container(
                // margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: ishidden,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: "تأكيد كلمة المرور",
                      hintText: " ادخل كلمة المرور الجديدة",
                      alignLabelWithHint: false,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.purple[400],
                      ),
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            Icons.visibility,
                          ))),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Row(children: <Widget>[
                Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'زبون عادي';
                        id = 1;
                        dropdownVisible = false;
                        buttonVisible = false;
                        type = 'normal';
                      });

                      ;
                      ;
                    }),
                Text(
                  'زبون عادي',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'طالب خاصة ';
                        id = 2;
                        buttonVisible = true;
                        dropdownVisible = true;
                        type = 'special';
                      });
                    }),
                Text(
                  'طالب جامعة خاصة',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                /*buttonVisible
                    ? Radio<int>(
                        value: 3,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'طالب خاصة ';
                            id = 3;
                            dropdownVisible = true;
                          });

                          ;
                          ;
                        })
                    : SizedBox(),*/
              ]),
              Padding(padding: EdgeInsets.all(5.0)),
              Row(children: <Widget>[
                buttonVisible
                    ? Text(
                        'اختر جامعتك',
                        style: new TextStyle(fontSize: 17.0),
                      )
                    : SizedBox(),
                Padding(padding: EdgeInsets.all(10.0)),
                dropdownVisible
                    ? DropdownButton<String>(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(" الجامعة السورية الخاصة  "),
                            value: " الجامعة السورية الخاصة  ",
                          ),
                          DropdownMenuItem(
                            child: Text(" الجامعة العربية الدولية  "),
                            value: " الجامعة العربية الدولية  ",
                          ),
                          DropdownMenuItem(
                              child: Text("جامعة قاسيون  "),
                              value: "جامعة قاسيون  "),
                          DropdownMenuItem(
                              child: Text("جامعة الرشيد"),
                              value: "جامعة الرشيد"),
                          DropdownMenuItem(
                              child: Text("جامعة اليرموك"),
                              value: "جامعة اليرموك"),
                          DropdownMenuItem(
                              child:
                                  Text("الجامعة الدولية للعلوم والتكنولوجيا "),
                              value: "الجامعة الدولية للعلوم والتكنولوجيا "),
                        ],
                        onChanged: (String value) {
                          setState(() {
                            _value = value;
                            university_name = value;
                          });
                        },
                      )
                    : SizedBox(),
                Padding(padding: EdgeInsets.all(5.0)),
              ]),
              ElevatedButton(
                onPressed: () async {
                  {
                    /*print('button pressed');
                    /*print('${_PhoneController.text}');
                    print('${_PasswordController.text}');
                    print('${_NameController.text}');
                    print('${_IdController.text}');
                    print('$type');
                    print('$university_name');*/
                    String url = "http://10.0.2.2:8000/api/auth/login";
                    dynamic res;
                    if (type == "normal") {
                      res = await http.post(url, headers: {
                        'Accept': 'application/json',
                      }, body: {
                        "phone": "${_PhoneController.text}",
                        //"name": "${_NameController.text}",
                        "password": "${_PasswordController.text}",
                        //"idnumber": "${_IdController.text}",
                        //"type": "$type",
                      });
                    } else {
                      res = await http.post(url, headers: {
                        'Accept': 'application/json',
                      }, body: {
                        "phone": "${_PhoneController.text}",
                        //"name": "${_NameController.text}",
                        "password": "${_PasswordController.text}",
                        //"idnumber": "${_IdController.text}",
                        //"type": "$type",
                      });
                    }
                    print('body is ${res.body}');
                    var data = json.decode(res.body);
                    print('data ${data["name"]}');
                    print('data ${data["phone"]}');
                    print('data ${data["token"]}');*/
                    /* if (formkey.currentState.validate()) {

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('processing data')));*/
                  }
                },
                child: Text(
                  'إنشاء حساب',
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Row(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        " تسجيل دخول ",
                        style: TextStyle(
                            //  decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Container(
                    child: Center(
                      child: Text(
                        " هل لديك حساب؟",
                        style: TextStyle(
                            //decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }

  void _togglePasswordView() {
    if (ishidden == true) {
      ishidden = false;
    } else
      ishidden = true;
    setState(() {});
  }

  void _toggleDroDowndView() {
    if (visible == true) {
      visible = false;
    } else
      visible = true;

    setState(() {});
  }
}
