import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/models/auth.dart';
import 'package:training/pages/details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<LoginResponse> login(String username, String password) async {
    final response = await http.post(
        Uri.parse("http://svr.myopensoft.net:8060/planmalaysia-iprp/api/login"),
        body: {
          "username": username,
          "password": password,
        });

    print(response.body);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: Container(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              //untuk cantikkan field
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: _controllerUsername,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000912),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: 'Sila Masukkan ID Pengguna',
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 75,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Sila Masukkan ID Pengguna';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              //untuk cantikkan field
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: _controllerPassword,
                // obscureText: true,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000912),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: 'Sila Masukkan Kata Laluan',
                  hintStyle: TextStyle(
                    color: Colors.red,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 75,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Sila Masukkan Kata Laluan';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                if (validateAndSave()) {
                  // await prefs.setString('email', _controllerUsername.text);

                  login(_controllerUsername.text, _controllerPassword.text)
                      .then((value) {
                    if (value.token != null) {
                      print(value.token.toString());
                      prefs.setString('token', value.token.toString());

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => DetailsPage(
                                  username: value.username.toString(),
                                  token: value.token.toString())),
                          (Route<dynamic> route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ID Pengguna/Kata Laluan Tidak Tepat'),
                        ),
                      );
                    }
                  });
                }
              },
              child: Text('Log Masuk'),
            ),
          ],
        ),
      )),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
