import 'package:flutter/material.dart';

class jobPosts extends StatefulWidget {
  const jobPosts({super.key, required this.selectedChip});
  final int selectedChip;

  @override
  State<jobPosts> createState() => _jobPostsState();
}

class _jobPostsState extends State<jobPosts> {
  List fakeJobData = ['Govt Job', 'Private Job', 'Bank Job', 'NGO Job'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          Container(color: Colors.green, child: Center(child: Text('Govt Job'),),),
          Container(color: Colors.indigo, child: Center(child: Text('Private Job'),),),
          Container(color: Colors.red, child: Center(child: Text('Bank Job'),),),
          Container(color: Colors.blue, child: Center(child: Text('NGO Job'),),),
        ],
        onPageChanged: (int index) {
          print(widget.selectedChip);
        },
      ),
    );
  }
}
