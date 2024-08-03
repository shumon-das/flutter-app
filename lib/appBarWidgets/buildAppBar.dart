
import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    title: Row(
      children: <Widget>[
        SizedBox(
          width: 50,
          child: Image.asset('assets/images/flower.jpg'),
        ),
        const SizedBox(width: 50),
        const Text('Mono Ranjan'),
      ],
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {
            print('something');
          },
          icon: const Icon(Icons.more_vert, size: 30,),
      ),
    ],
  );
}