import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Mini_screen/liked_list_of_beyt.dart';
import '../Mini_screen/liked_list_of_poem.dart';
import '../Mini_screen/liked_list_of_speech.dart';
import '../Mini_screen/liked_list_of_story.dart';


class LikedScreen extends StatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color(0xFFECF0F1),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/icons/corner_tl.png',
              width: 30,
              height: 30,
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              LikedPageTabs(label: 'ابیات'),
              LikedPageTabs(label: 'اشعار'),
              LikedPageTabs(label: 'سخن'),
              LikedPageTabs(label: 'داستان'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: LikedListOfBeyts()),
            Center(child: LikedListOfPoems()),
            Center(child: LikedListOfSpeechs()),
            Center(child: LikedListOfStories()),
          ],
        ),
      ),
    );
  }
}

class LikedPageTabs extends StatelessWidget {
  final String label;

  const LikedPageTabs({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(label, style: TextStyle(color: Color(0xFFE7E182))),
    );
  }
}
