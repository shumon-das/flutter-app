import 'package:flutter/material.dart';

import '../users/profile_page.dart';

Material homePostHeader(BuildContext context, Map<dynamic, dynamic> writer) {
  return Material(
      child: ListTile(
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  "assets/images/einstein.png",
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image), width: 50, height: 50,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.74,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          // row['writer_name'].replaceFirst(row['writer_name'][0], row['writer_name'][0].toUpperCase()),
                          child: Text(
                            writer['writer_name'].replaceFirst(writer['writer_name'][0], writer['writer_name'][0].toUpperCase()),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProfilePage()),
                            );
                          },
                        ),
                        Row(
                          children: [
                            Container(
                                color: Colors.black12,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text('3h ago', style: TextStyle(fontSize: 12/*, color: Colors.white*/)),
                                )
                            ),
                            const SizedBox(width: 10),
                            Container(
                                color: Colors.black12,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text('5k read', style: TextStyle(fontSize: 12/*, color: Colors.white*/)),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                         onPressed: () {},
                         icon: const Icon(Icons.more_vert, size: 30),
                     ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
  );
}