import 'package:flutter/material.dart';

class GovtJobPost extends StatefulWidget {
  const GovtJobPost({super.key});

  @override
  State<GovtJobPost> createState() => _GovtJobPostState();
}

class _GovtJobPostState extends State<GovtJobPost> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: Center(child: Text('Govt Job'),),);
  }
}
