import 'package:flutter/material.dart';

import 'home_post_details.dart';
import 'home_post_footer.dart';
import 'home_post_header.dart';

List fakeData = [
    {"img": "assets/images/tagore.png", "writer_name": "rabindranath thakur", "capital": "New Delhi"},
    {"img": "assets/images/twain.png", "writer_name": "mark toen", "capital": "Washington, D.C."},
    {"img": "assets/images/tagore.png", "writer_name": "maxim gurky", "capital": "Ottawa"},
    {"img": "assets/images/shakespeare.png", "writer_name": "william saxpior", "capital": "Berlin"},
    {"img": "assets/images/tolstoy.png", "writer_name": "leo tolstoy", "capital": "Paris"},
    {"img": "assets/images/einstein.png", "writer_name": "albert einstein", "capital": "Tokyo"},
];
String gora = '''গোরা রবীন্দ্রনাথ ঠাকুরের একটি উপন্যাস। এটি ১৮৮০-এর দশকে ব্রিটিশ রাজত্বকালের সময়কার কলকাতার পটভূমিতে লেখা।
                এটি লেখার ক্রমে পঞ্চম এবং রবীন্দ্রনাথের তেরোটি উপন্যাসের মধ্যে সবচেয়ে দীর্ঘতম।[১] এটি রাজনীতি এবং ধর্ম নিয়ে দার্শনিক বিতর্কে সমৃদ্ধ উপন্যাস। উপন্যাসে মুক্তি,
                সর্বজনীনতা, ভ্রাতৃত্ব, লিঙ্গ, নারীবাদ, বর্ণ, শ্রেণি, ঐতিহ্য বনাম আধুনিকতা, নগর অভিজাত বনাম গ্রামীণ কৃষক, ঔপনিবেশিক শাসন, জাতীয়তাবাদ এবং ব্রাহ্মসমাজ নিয়ে লেখা রয়েছে।
                উপন্যাসের প্রধান চরিত্র হিসেবে চোখে পরে - গোরা।''';

Expanded homePosts(BuildContext context) {
// var listData = {'id': 1, 'title': 'গোরা', 'content': 'rings'};
Map<String, dynamic> listData = {};
listData['id'] = 1;
listData['title'] = 'গোরা';
listData['content'] = gora;

  return Expanded(
      child: ListView(
        children: fakeData.map((row) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              homePostHeader(context, row),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Text(
                  gora,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              OutlinedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePostDetails(value: listData))
                    );
                  },
                  child: const Text('Read More...'),
              ),
              const Divider(),
              homePostFooter(context),
            ],
          );
        }).toList(),
      ),
  );
}