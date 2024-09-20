import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (context) {},
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
              hintText: 'Search...'
            ),
          ),
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              // backgroundColor: Colors.white,
              foregroundColor: Colors.white
            ),
            onPressed: () {
              Navigator.pop(context);
              // setState(() {
              //   isSearchPressed = !isSearchPressed;
              // });
            },
            icon: const Icon(Icons.close)
          ),
        ],
      ),
    );
  }
}
