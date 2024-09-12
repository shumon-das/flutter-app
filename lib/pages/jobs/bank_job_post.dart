import 'package:flutter/material.dart';

class BankJobPost extends StatefulWidget {
  const BankJobPost({super.key});

  @override
  State<BankJobPost> createState() => _BankJobPostState();
}

class _BankJobPostState extends State<BankJobPost> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: Center(child: Text('Bank Job'),),);
  }
}
