import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginnewPage extends StatefulWidget {
  LoginnewPage({Key? key}) : super(key: key);

  @override
  _LoginnewPageState createState() => _LoginnewPageState();
}

class _LoginnewPageState extends State<LoginnewPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Masuk'),
        backgroundColor: Colors.teal[400],
        elevation: 0,
      ),
      body: Container(
        color: Colors.teal[400],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/user-photo.png', scale: 3.5),
                  SizedBox(height: 20),
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    //untuk cantikkan field
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 20, top: 20),
                    child: TextFormField(
                      controller: _controllerUsername,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 25),
                        hintText: 'Masukkan Emel',
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
                          return 'Masukkan Emel Pengguna';
                        }
                        // username = usernameValue;
                        return null;
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
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 25),
                        hintText: 'Masukkan Kata Laluan',
                        hintStyle: TextStyle(
                          color: Color(0xffA6B0BD),
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
                          return 'Masukkan Kata Laluan';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (validateAndSave()) {
                        _saveName();
                        print('test text button');

                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => HomePage(
                        //             name: name,
                        //             password: _controllerPassword.text,
                        //             age: 15,
                        //             details: 'Ini kelas training')),
                        //     (Route<dynamic> route) => false);
                      }
                    },
                    child: Text(
                      'LOG MASUK',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _controllerUsername.text);
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
