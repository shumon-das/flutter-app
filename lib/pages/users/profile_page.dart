import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      color: Colors.indigo,
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(100.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset('assets/images/einstein.png', width: 100, height: 100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text(
                'Albert Einstein',
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Center(
            child: Text(
                'জন্ম:	৭ মে ১৮৬১, মৃত্যু:	৭ আগস্ট ১৯৪১ (বয়স ৮০)',
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
