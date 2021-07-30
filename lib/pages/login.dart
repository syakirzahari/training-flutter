import 'package:flutter/material.dart';
import 'package:training/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

//untuk initialize page state (guna bila lauch current page)
  @override
  void initState() {
    super.initState();
  }

//untuk close/dispose page state (guna bila tutup current page)
  @override
  void dispose() {
    // DO STUFF
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
        backgroundColor: Colors.yellow,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: Container(
        //Untuk set screen height dan width/responsive screen
        height: size.height,
        width: size.width,
        child: Form(
            key: globalFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                    // decoration: InputDecoration(
                    //   contentPadding: EdgeInsets.symmetric(vertical: 25),
                    //   hintText: 'Sila isi',
                    //   hintStyle: TextStyle(
                    //     color: Color(0xffA6B0BD),
                    //   ),
                    //   fillColor: Colors.white,
                    //   filled: true,
                    //   prefixIcon: Icon(Icons.person),
                    //   prefixIconConstraints: BoxConstraints(
                    //     minWidth: 75,
                    //   ),
                    //   enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(50),
                    //     ),
                    //     borderSide: BorderSide(color: Colors.white),
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(50),
                    //     ),
                    //     borderSide: BorderSide(color: Colors.white),
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(height: 20),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000912),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: 'Sila isi',
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
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    _saveName();
                    print('test text button');
                  },
                  child: Text(
                    'Sila Tekan Untuk Simpan Nama',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                OutlinedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () => _showMyDialog(),
                  child: Text('Sila Tekan'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text('Sila Tekan'),
                ),
                Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 20, bottom: 50),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x60008FFF),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                            spreadRadius: 0,
                          ),
                        ]),
                    child: TextButton(
                      onPressed: () {
                        print('test text button');
                        String name = _controllerUsername.text;

                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage(
                                  name: name,
                                  password: _controllerPassword.text,
                                  age: 15,
                                  details: 'Ini kelas training')),
                        );

                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => HomePage(
                        //             name: name,
                        //             password: _controllerPassword.text,
                        //             age: 15,
                        //             details: 'Ini kelas training')),
                        //     (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "SILA TEKAN",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 3,
                        ),
                      ),
                    )),
              ],
            )),
      )),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title Test'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('How are you?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _controllerUsername.text);
  }
}
