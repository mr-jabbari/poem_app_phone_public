import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:poem_app_phone/Mini_screen/list_of_speech.dart';
import 'package:poem_app_phone/Mini_screen/list_of_story.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Mini_screen/list_of_beyt.dart';
import '../Mini_screen/list_of_poem.dart';
import '../widgets/MyCostumeIcon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              FirstPageTabs(label: 'ابیات'),
              FirstPageTabs(label: 'اشعار'),
              FirstPageTabs(label: 'سخن'),
              FirstPageTabs(label: 'داستان'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: ListOfBeyts()),
            Center(child: ListOfPoems()),
            Center(child: ListOfSpeechs()),
            Center(child: ListOfStories()),
          ],
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.teal,
          icon: Icons.add,
          iconTheme: IconThemeData(size: 40.0),
          foregroundColor: Color(0xFFC5BE6A),
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              child: MyCoustomeIcons(
                iconName: 'add_y',
                color: 0xFFC5BE6A,
                size: 16,
              ),
              backgroundColor: Colors.teal,
              label: 'بیت',
              onTap: () {
                Navigator.pushNamed(context, "/beyt_data");
              },
            ),
            SpeedDialChild(
              child: MyCoustomeIcons(
                iconName: 'add_y',
                color: 0xFFC5BE6A,
                size: 16,
              ),
              backgroundColor: Colors.teal,
              label: 'شعر',
              onTap: () {
                // TODO: Implement logic for option 2
              },
            ),
            SpeedDialChild(
              child: MyCoustomeIcons(
                iconName: 'add_y',
                color: 0xFFC5BE6A,
                size: 16,
              ),
              backgroundColor: Colors.teal,
              label: 'داستان',
              onTap: () {
                // TODO: Implement logic for option 3
              },
            ),
            SpeedDialChild(
              child: MyCoustomeIcons(
                iconName: 'add_y',
                color: 0xFFC5BE6A,
                size: 14,
              ),
              backgroundColor: Colors.teal,
              label: 'سخن',
              onTap: () {
                // TODO: Implement logic for option 4
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPageTabs extends StatelessWidget {
  final String label;

  const FirstPageTabs({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(label, style: TextStyle(color: Color(0xFFE7E182))),
    );
  }
}
