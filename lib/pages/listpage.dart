import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> items =
      List<String>.generate(100, (i) => 'Item nombor $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
            subtitle: Text('Subtitle untuk data ${items[index]}'),
          );
          // return Card(
          //   color: Colors.yellow,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('${items[index]}'),
          //       Text('${items[index]}'),
          //       Text('${items[index]}')
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
