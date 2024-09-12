import 'package:flutter/material.dart';

homePostFooter(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 70,
    child: Card(
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken)),
          IconButton(onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      Text('data 1 data 1 data 1 data 1 data 1 '),
                      Text('data 2'),
                      Text('data 3'),
                      Container(
                        child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Comment',
                              border: OutlineInputBorder(),
                            ),
                        ),
                      ),
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close))
                    ],
                  );
                }
            );
          }, icon: Icon(Icons.comment)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
    ),
  );
}