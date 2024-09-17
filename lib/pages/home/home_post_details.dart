import 'package:flutter/material.dart';

class HomePostDetails extends StatefulWidget {
  const HomePostDetails({super.key, required this.value});
  final Map<String, dynamic> value;

  @override
  State<HomePostDetails> createState() => _HomePostDetailsState();
}

class _HomePostDetailsState extends State<HomePostDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.value['name']!, style: TextStyle(color: Colors.white70)),
        title: Text('${widget.value['title']}', style: const TextStyle(color: Colors.white70)),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Text('${widget.value['id']}'),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Text(
              '${widget.value['content']}',
              style: const TextStyle(fontSize: 17),
            ),
          )
          // Text('content')
        ],
      ),
    );
    // return Center(child: TextButton(onPressed: () {
    //   Navigator.pop(context);
    // }, child: Text('Go Back'),),);
  }
}
