import 'package:flutter/material.dart';

import 'categories/aphorism.dart';
import 'categories/jokes.dart';
import 'categories/natok.dart';
import 'categories/novel.dart';
import 'categories/poem.dart';
import 'categories/songs.dart';
import 'categories/stories.dart';
import 'categories/thesis.dart';
import 'home_post.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List chips = ['stories', 'poem', 'jokes', 'thesis', 'novel', 'aphorism', 'natok', 'Songs'];
  static int? selectedChip = 0;

  final controller = PageController(initialPage: selectedChip ?? 0);

  static const posts = [
    Stories(),
    Poem(),
    Jokes(),
    Thesis(),
    Novel(),
    Aphorism(),
    Natok(),
    Songs()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Wrap(
                    spacing: 5,
                    children: List<Widget>.generate(chips.length, (int index) {
                    return ChoiceChip(
                        label: Text(chips[index]),
                        selected: selectedChip == index,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedChip = selected ? index : null;
                            controller.animateToPage(
                                selectedChip ?? 0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                            );
                          });
                        },
                    );
                  }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: posts,
                onPageChanged: (int index) {
                  setState(() {
                    selectedChip = index;
                  });
                },
              ),
            ),
            // homePosts(context),
          ],
        ),
      ),
    );
  }
}
