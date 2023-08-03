import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Mini_screen/bookmarked_list_of_beyt.dart';
import '../Mini_screen/bookmarked_list_of_poem.dart';
import '../Mini_screen/bookmarked_list_of_speech.dart';
import '../Mini_screen/bookmarked_list_of_story.dart';

class BookmarkedScreen extends StatefulWidget {
  const BookmarkedScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkedScreen> createState() => _BookmarkedScreenState();
}

class _BookmarkedScreenState extends State<BookmarkedScreen> {
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
              BookmakedPageTabs(label: 'ابیات'),
              BookmakedPageTabs(label: 'اشعار'),
              BookmakedPageTabs(label: 'سخن'),
              BookmakedPageTabs(label: 'داستان'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: BookmarkedListOfBeyts()),
            Center(child: BookmarkedListOfPoems()),
            Center(child: BookmarkedListOfSpeechs()),
            Center(child: BookmarkedListOfStories()),
          ],
        ),
      ),
    );
  }
}

class BookmakedPageTabs extends StatelessWidget {
  final String label;

  const BookmakedPageTabs({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(label, style: TextStyle(color: Color(0xFFE7E182))),
    );
  }
}
