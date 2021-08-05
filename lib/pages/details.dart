import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/pages/login.dart';

class DetailsPage extends StatefulWidget {
  final String? token;
  final String? username;
  DetailsPage({Key? key, this.token, this.username}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? name;
  String? email;

  //untuk initialize page state (guna bila lauch current page)
  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

//untuk close/dispose page state (guna bila tutup current page)
  @override
  void dispose() {
    // DO STUFF
    super.dispose();
  }

  //Loading value on start
  // void _loadUserPreference() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = (prefs.getString('name') ?? '');
  //   });
  // }

  void _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = (prefs.getString('email') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Center(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang, ' + widget.username.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(widget.token.toString()),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                //tunjuk popup dialog
                showAlertDialog(context);
              },
              child: Text('Log Keluar'),
            ),
          ],
        ))),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "Tidak",
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Ya",
    ),
    onPressed: () {
      //delete token jika ingin logout
      _deleteToken();
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Log Keluar",
    ),
    content: Text(
      "Adakah anda pasti?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void _deleteToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.remove("token").then((value) => {
        print(['token deleted']),
      });
}
