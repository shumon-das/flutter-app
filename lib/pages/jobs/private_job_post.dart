import 'package:flutter/material.dart';

class PrivateJobPost extends StatefulWidget {
  const PrivateJobPost({super.key});

  @override
  State<PrivateJobPost> createState() => _PrivateJobPostState();
}

class _PrivateJobPostState extends State<PrivateJobPost> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.indigo, child: Center(child: Text('Private Job'),),);
  }
}
