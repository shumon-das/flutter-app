import 'package:flutter/material.dart';

import 'bank_job_post.dart';
import 'govt_job_post.dart';
import 'ngo_job_post.dart';
import 'private_job_post.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  static List chips = ['Govt Job', 'Private Job', 'Bank Job', 'NGO Job'];
  static int? selectedChip = 0;

  static const posts = [
    GovtJobPost(),
    PrivateJobPost(),
    BankJobPost(),
    NgoJobPost(),
  ];

  final controller = PageController(initialPage: selectedChip ?? 0);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

