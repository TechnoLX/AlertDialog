import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.all(15),
            color: Colors.blue[400],
            onPressed: () => _showMyDialog(context),
            child: Text(
              'Show Dialog',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            padding: EdgeInsets.all(15),
            color: Colors.blue[400],
            onPressed: () => _showIOSDialog(context),
            child: Text(
              'Show IOS Dialog',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // RaisedButton(
          //   padding: EdgeInsets.all(15),
          //   color: Colors.blue[400],
          //   onPressed: () {
          //     Scaffold.of(context).showSnackBar(
          //         SnackBar(content: Text('You tap to open a snackbar')));
          //   },
          //   child: Text(
          //     'Show Snackbar',
          //     style: TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          Builder(
            builder: (context) => RaisedButton(
              padding: EdgeInsets.all(15),
              color: Colors.blue[400],
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('You tap to open a snackbar'),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {},
                  ),
                ));
              },
              child: Text(
                'Show Snackbar',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueAccent[50],
          elevation: 50,
          title: Text('Alert Dialog Demo'),
          content: Text(
              'This is simple Alert Dialog box. Press "Got It" to dismiss this dialog box.'),
          actions: <Widget>[
            TextButton(
              child: Text('Got It'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

Future<void> _showIOSDialog(BuildContext context) async {
  return showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          //backgroundColor: Colors.blueAccent[50],
          //elevation: 50,
          title: Text('IOS Alert Dialog Demo'),
          content: Text(
              'This is simple IOS-styles Alert Dialog box. Press "Got It" to dismiss this dialog box.'),
          actions: <Widget>[
            TextButton(
              child: Text('Got It'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
