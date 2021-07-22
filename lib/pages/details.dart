import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? name;

  //untuk initialize page state (guna bila lauch current page)
  @override
  void initState() {
    super.initState();
    _loadUserPreference();
  }

//untuk close/dispose page state (guna bila tutup current page)
  @override
  void dispose() {
    // DO STUFF
    super.dispose();
  }

  //Loading value on start
  void _loadUserPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString('name') ?? '');
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
          children: [Text(name ?? 'Tiada')],
        ))),
      ),
    );
  }
}
