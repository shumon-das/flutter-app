import 'package:flutter/material.dart';

class NgoJobPost extends StatefulWidget {
  const NgoJobPost({super.key});

  @override
  State<NgoJobPost> createState() => _NgoJobPostState();
}

class _NgoJobPostState extends State<NgoJobPost> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: Center(child: Text('NGO Job'),),);
  }
}
