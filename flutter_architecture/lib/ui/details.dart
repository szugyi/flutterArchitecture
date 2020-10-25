import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Details for:',
          ),
          Text(
            '$id',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
