import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        'Category Screen',
        style: Theme.of(context).textTheme.bodyText1,
      )),
    );
  }
}
